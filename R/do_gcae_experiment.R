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

  if ("you just want to get the" == "command-line arguments") {
    cat(
      gcaer::create_gcae_train_more_args(
        gcae_setup = gcae_setup, resume_from = 0, epochs = 1, save_interval = 1
      )
    )
    cat(
      gcaer::create_gcae_train_more_args(
        gcae_setup = gcae_setup, resume_from = 1, epochs = 1, save_interval = 1
      )
    )
  }

  analyse_epochs <- gcae_experiment_params$analyse_epochs
  resume_froms <- c(0, analyse_epochs[-length(analyse_epochs)])
  n_epochs <- analyse_epochs - resume_froms
  train_filenameses <- list() # Reduplicated plural
  HIERO

  for (i in seq_along(n_epochs)) {
    if (verbose) message(i, "/", length(analyse_epochs))
    # Train to this 'epochs'
    train_filenameses[[i]] <- gcae_train_more(
      gcae_setup = gcae_experiment_params$gcae_setup,
      resume_from = resume_froms[i],
      epochs = n_epochs[i],
      save_interval = epochs,
      verbose = verbose
    )
  }
  expect_true(all(file.exists(train_filenames)))

  if (1 == 2) {
    Sys.time()

    # 3. Project
    Sys.time()
    project_filenames <- gcae_project(
      gcae_setup = gcae_setup,
      gcae_options = gcae_options,
      verbose = TRUE
    )
    Sys.time()

    project_results <- parse_project_files(project_filenames)
    expect_equal(
      names(project_results),
      c("losses_from_project_table", "genotype_concordances_table")
    )

    # 4. Plot
    if (1 == 2) {
      plot_filenames <- gcae_plot(
        superpops = gcae_setup$superpops,
        gcae_setup = gcae_setup,
        verbose = TRUE
      )
      plot_filenames
      Sys.time()
    }
    if (1 == 2) {
      gcae_evaluate(
        gcae_setup = gcae_setup,
        gcae_options = gcae_options,
        verbose = TRUE
      )
    }

  }

  gcae_experiment_results <- list(
    dimensionality_reduction_scores = tibble::tibble(),
    phenotype_prediction_scores = tibble::tibble()
  )

  gcae_experiment_results
}
