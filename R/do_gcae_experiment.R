#' Do a full `GCAE` experiment
#'
#' Do a full `GCAE` experiment
#' @inheritParams default_params_doc
#' @return a `gcae_experiment_results`
#' @author Richèl J.C. Bilderbeek
#' @export
do_gcae_experiment <- function(
  gcae_experiment_params,
  verbose = FALSE
) {
  gcaer::check_gcae_experiment_params(gcae_experiment_params)

  analyse_epochs <- gcae_experiment_params$analyse_epochs
  resume_froms <- c(0, analyse_epochs[-length(analyse_epochs)])
  n_epochs <- analyse_epochs - resume_froms

  # Results
  losses_from_project_list <- list()
  genotype_concordances_list <- list()
  scores_per_pops_list <- list()
  scores_list <- list()
  train_filenames <- NA # Will be overwritten by each last training session

  for (i in seq_along(n_epochs)) {

    if (verbose) {
      message(i, "/", length(analyse_epochs))
    }
    # Train to this 'epochs'

    # 'train_filenames' will overwrite/update the same files every epoch
    train_filenames <- gcae_train_more(
      gcae_setup = gcae_experiment_params$gcae_setup,
      resume_from = resume_froms[i],
      epochs = n_epochs[i],
      save_interval = n_epochs[i],
      verbose = verbose
    )
    if (verbose) {
      message(paste(train_filenames, collapse = "\n"))
    }
    project_filenames <- gcae_project(
      gcae_setup = gcae_experiment_params$gcae_setup,
      gcae_options = gcae_experiment_params$gcae_options,
      verbose = verbose
    )
    if (verbose) {
      message(paste(project_filenames, collapse = "\n"))
    }
    t_project_results <- gcaer::parse_project_files(project_filenames)
    t_project_results$losses_from_project_table$epoch <- analyse_epochs[i]
    t_project_results$genotype_concordances_table$epoch <- analyse_epochs[i]
    losses_from_project_list[[i]] <- t_project_results$losses_from_project_table
    genotype_concordances_list[[i]] <- t_project_results$genotype_concordances_table

    evaluate_filenames <- gcaer::gcae_evaluate(
      gcae_setup = gcae_experiment_params$gcae_setup,
      gcae_options = gcae_experiment_params$gcae_options,
      metrics = gcae_experiment_params$metrics,
      epoch = analyse_epochs[i],
      verbose = verbose
    )
    evaluate_results <- gcaer::parse_evaluate_filenames(
      evaluate_filenames = evaluate_filenames,
      epoch = analyse_epochs[i]
    )
    evaluate_results$t_scores_per_pop$epoch <- analyse_epochs[i]
    evaluate_results$t_scores <- analyse_epochs[i]
    scores_per_pops_list[[i]] <- evaluate_results$t_scores_per_pop
    scores_list[[i]] <- evaluate_results$t_scores
  }

  losses_from_project_tables <- dplyr::bind_rows(losses_from_project_list)
  genotype_concordances_tables <- dplyr::bind_rows(genotype_concordances_list)
  scores_per_pops_tables <- dplyr::bind_rows(scores_per_pops_list)
  scores_tables <- dplyr::bind_rows(scores_list)
  train_filenames <- NA # Will be overwritten by each last training session

  gcae_experiment_results <- list(
    dimensionality_reduction_scores = tibble::tibble(),
    phenotype_prediction_scores = tibble::tibble()
  )

  gcae_experiment_results
}
