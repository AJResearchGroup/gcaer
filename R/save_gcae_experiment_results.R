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
  filenames <- list(
    scores_per_pop_filename = file.path(folder_name, "scores_per_pop.csv"),
    scores_filename = file.path(folder_name, "scores.csv"),
    genotype_concordances_filename =
      file.path(folder_name, "genotype_concordances.csv"),
    phenotype_predictions_filename =
      file.path(folder_name, "phenotype_predictions.csv"),
    train_times_filename = file.path(folder_name, "train_times.csv"),
    losses_from_train_t_filename =
      file.path(folder_name, "losses_from_train_t.csv"),
    losses_from_train_v_filename =
      file.path(folder_name, "losses_from_train_v.csv")
  )

  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  readr::write_csv(
    x = gcae_experiment_results$scores_per_pop_table,
    file = filenames$scores_per_pop_filename
  )
  readr::write_csv(
    gcae_experiment_results$scores_table,
    file = filenames$scores_filename
  )
  readr::write_csv(
    gcae_experiment_results$genotype_concordances_table,
    file = filenames$genotype_concordances_filename
  )
  readr::write_csv(
    gcae_experiment_results$phenotype_predictions_table,
    file = filenames$phenotype_predictions_filename
  )
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
  filenames
}
