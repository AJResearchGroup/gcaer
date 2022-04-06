#' Save a `gcae_experiment_results` to file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso
#' Use \link{read_gcae_experiment_results_file} to read
#' a `gcae_experiment_results` from file
#' @examples
#' # Create a gcae_experiment_results
#' gcae_experiment_results <- create_test_gcae_experiment_results()
#'
#' # Use a temporary file
#' gcae_experiment_results_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_experiment_results to temporary file
#' save_gcae_experiment_results(
#'   gcae_experiment_results = gcae_experiment_results,
#'   gcae_experiment_results_filename = gcae_experiment_results_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_experiment_results
#' gcae_experiment_results_again <- read_gcae_experiment_results_file(gcae_experiment_results_filename)
#'
#' # Cleanup
#' file.remove(gcae_experiment_results_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_gcae_experiment_results <- function(
  gcae_experiment_results,
  gcae_experiment_params
) {
  gcaer::check_gcae_experiment_results(gcae_experiment_results)
  gcaer::check_gcae_experiment_params(gcae_experiment_params)
  readr::write_csv(
    x = gcae_experiment_results$scores_per_pop_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "scores_per_pop.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$scores_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "scores.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$genotype_concordances_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "genotype_concordances.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$phenotype_predictions_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "phenotype_predictions.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$train_times_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "train_times.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_t_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "losses_from_train_t.csv"
    )
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_v_table,
    file = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "losses_from_train_v.csv"
    )
  )
}
