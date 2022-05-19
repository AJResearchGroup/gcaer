#' Save a `gcae_experiment_results` to file
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' # Create a gcae_experiment_results
#' gcae_experiment_results <- create_test_gcae_experiment_results()
#'
#' # Use a temporary file
#' folder_name <- get_gcaer_tempfilename()
#'
#' # Save gcae_experiment_results to temporary file
#' filenames <- save_gcae_experiment_results(
#'   gcae_experiment_results = gcae_experiment_results,
#'  folder_name = folder_name
#' )
#'
#' # Cleanup
#' file.remove(unlist(filenames))
#' @author Richèl J.C. Bilderbeek
#' @export
save_gcae_experiment_results <- function(
  gcae_experiment_results,
  folder_name
) {
  gcaer::check_gcae_experiment_results(gcae_experiment_results)
  gcaer::check_folder_name(folder_name)

  filenames <- gcaer::get_gcae_experiment_results_filenames(folder_name)

  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  readr::write_csv(
    x = gcae_experiment_results$score_per_pop_table,
    file = filenames$score_per_pop_filename
  )
  readr::write_csv(
    gcae_experiment_results$scores_table,
    file = filenames$scores_filename
  )
  readr::write_csv(
    gcae_experiment_results$genotype_concordances_table,
    file = filenames$genotype_concordances_filename
  )
  if ("phenotype_predictions_table" %in% names(gcae_experiment_results) &&
      tibble::is_tibble(gcae_experiment_results$phenotype_predictions_table)) {
    readr::write_csv(
      gcae_experiment_results$phenotype_predictions_table,
      file = filenames$phenotype_predictions_filename
    )
  } else {
    filenames$phenotype_predictions_filename <- NULL
  }
  readr::write_csv(
    gcae_experiment_results$train_times_table,
    file = filenames$train_times_filename
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_t_table,
    file = filenames$losses_from_train_t_filename
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_v_table,
    file = filenames$losses_from_train_v_filename
  )
  if ("nmse_in_time_table" %in% names(gcae_experiment_results) &&
      tibble::is_tibble(gcae_experiment_results$nmse_in_time_table)) {
    readr::write_csv(
      gcae_experiment_results$nmse_in_time_table,
      file = filenames$nmse_in_time_filename
    )
  } else {
    filenames$nmse_in_time_filename <- NULL
  }
  filenames
}
