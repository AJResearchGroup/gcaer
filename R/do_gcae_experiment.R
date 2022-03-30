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

  project_resultses <- list() # reduplicated plural indeed
  evaluate_resultses <- list() # reduplicated plural indeed
  train_filenames <- NA # Will be overwritten by each last training session
  for (i in seq_along(n_epochs)) {

    if (verbose) message(i, "/", length(analyse_epochs))
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
    project_resultses[[i]] <- t_project_results

    evaluate_filenames <- gcaer::gcae_evaluate(
      gcae_setup = gcae_experiment_params$gcae_setup,
      gcae_options = gcae_experiment_params$gcae_options,
      metrics = gcae_experiment_params$metrics,
      epoch = analyse_epochs[i],
      verbose = TRUE
    )
    evaluate_results <- gcaer::parse_evaluate_filenames(evaluate_filenames)
    evaluate_results$t_scores_per_pop$epoch <- analyse_epochs[i]
    evaluate_results$t_scores <- analyse_epochs[i]
    evaluate_resultses[[i]] <- evaluate_results
  }
  "HIERO"
  gcae_experiment_results <- list(
    dimensionality_reduction_scores = tibble::tibble(),
    phenotype_prediction_scores = tibble::tibble()
  )

  gcae_experiment_results
}
