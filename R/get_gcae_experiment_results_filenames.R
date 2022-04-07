#' Get a list of filenames the GCAE results will be saved to
#'
#' Get a list of filenames the GCAE results will be saved to
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' get_gcae_experiment_results_filenames(folder_name = tempdir())
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_experiment_results_filenames <- function(
  folder_name
) {
  gcaer::check_folder_name(folder_name)
  list(
    genotype_concordances_filename =
      file.path(folder_name, "genotype_concordances.csv"),
    losses_from_train_t_filename =
      file.path(folder_name, "losses_from_train_t.csv"),
    losses_from_train_v_filename =
      file.path(folder_name, "losses_from_train_v.csv"),
    nmse_in_time_filename =
      file.path(folder_name, "nmse_in_time.csv"),
    phenotype_predictions_filename =
      file.path(folder_name, "phenotype_predictions.csv"),
    scores_filename =
      file.path(folder_name, "scores.csv"),
    scores_per_pop_filename =
      file.path(folder_name, "scores_per_pop.csv"),
    train_times_filename =
      file.path(folder_name, "train_times.csv")
  )
}
