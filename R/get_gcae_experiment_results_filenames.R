#' Get a list of filenames the GCAE results will be saved to
#'
#' Get a list of filenames the GCAE results will be saved to
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' get_gcae_experiment_results_filenames(folder_name = tempdir())
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_experiment_results_filenames <- function( # nolint indeed a long function name
  folder_name,
  file_extension = ".csv"
) {
  gcaer::check_folder_name(folder_name)
  gcaer::check_file_extension(file_extension)
  list(
    genotype_concordances_filename =
      file.path(folder_name, paste0("genotype_concordances", file_extension)),
    losses_from_train_t_filename =
      file.path(folder_name, paste0("losses_from_train_t", file_extension)),
    losses_from_train_v_filename =
      file.path(folder_name, paste0("losses_from_train_v", file_extension)),
    nmse_in_time_filename =
      file.path(folder_name, paste0("nmse_in_time", file_extension)),
    phenotype_predictions_filename =
      file.path(folder_name, paste0("phenotype_predictions", file_extension)),
    r_squared_in_time_filename =
      file.path(folder_name, paste0("r_squared_in_time", file_extension)),
    scores_filename =
      file.path(folder_name, paste0("scores", file_extension)),
    score_per_pop_filename =
      file.path(folder_name, paste0("score_per_pop", file_extension)),
    train_times_filename =
      file.path(folder_name, paste0("train_times", file_extension))
  )
}
