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

  project_resultses <- list()
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
    project_filenames <- gcae_project(
      gcae_setup = gcae_experiment_params$gcae_setup,
      gcae_options = gcae_experiment_params$gcae_options,
      verbose = verbose
    )
    project_resultses[[i]] <- parse_project_files(project_filenames)
    filenames_from <- stringr::str_subset(project_filenames, pattern = "^.*.csv$")
    filenames_to <- stringr::str_replace(
      string = filenames_from,
      pattern = ".csv",
      replacement = paste0("_", analyse_epochs[i], ".csv")
    )
    gcaer::rename_files(filenames_from = filenames_from, filenames_to = filenames_to)

    evaluate_filenames <- gcaer::gcae_evaluate(
      gcae_setup = gcae_experiment_params$gcae_setup,
      gcae_options = gcae_experiment_params$gcae_options,
      metrics = gcae_experiment_params$metrics,
      epoch = analyse_epochs[i],
      verbose = TRUE
    )
  }

  gcae_experiment_results <- list(
    dimensionality_reduction_scores = tibble::tibble(),
    phenotype_prediction_scores = tibble::tibble()
  )

  gcae_experiment_results
}
