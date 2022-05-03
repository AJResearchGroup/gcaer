#' Create plots from the saved GCAE experiment's results
#'
#' Create plots from the saved GCAE experiment's results
#' @inheritParams default_params_doc
#' @return filename of the saved plots
#' @examples
#' create_test_gcae_setup()
#' check_gcae_setup(create_test_gcae_setup())
#' @author Richèl J.C. Bilderbeek
#' @export
create_plots_from_gcae_experiment_results <- function( # nolint indeed a long function name
  folder_name
) {
  gcaer::check_folder_name(folder_name)
  csv_filenames <- gcaer::get_gcae_experiment_results_filenames(
    folder_name = folder_name,
    file_extension = ".csv"
  )
  png_filenames <- gcaer::get_gcae_experiment_results_filenames(
    folder_name = folder_name,
    file_extension = ".png"
  )

  if (
    nrow(
      readr::read_csv(csv_filenames$score_per_pop_filename, show_col_types = FALSE)
    ) > 0
  ) {
    gcaer::plot_score_per_pop_from_file(
      score_per_pop_filename = csv_filenames$score_per_pop_filename,
      png_filename = png_filenames$score_per_pop_filename
    )
  }
  if (
    nrow(
      readr::read_csv(csv_filenames$scores_filename, show_col_types = FALSE)
    ) > 0
  ) {
    gcaer::plot_scores_from_file(
      scores_filename = csv_filenames$scores_filename,
      png_filename = png_filenames$scores_filename
    )
  }
  gcaer::plot_genotype_concordances_from_file(
    genotype_concordances_filename =
      csv_filenames$genotype_concordances_filename,
    png_filename = png_filenames$genotype_concordances_filename
  )
  gcaer::plot_phenotype_predictions_from_file(
    phenotype_predictions_filename =
      csv_filenames$phenotype_predictions_filename,
    png_filename = png_filenames$phenotype_predictions_filename
  )
  gcaer::plot_train_times_from_file(
    train_times_filename = csv_filenames$train_times_filename,
    png_filename = png_filenames$train_times_filename
  )
  gcaer::plot_losses_from_train_t_from_file(
    losses_from_train_t_filename = csv_filenames$losses_from_train_t_filename,
    png_filename = png_filenames$losses_from_train_t_filename
  )
  gcaer::plot_losses_from_train_v_from_file(
    losses_from_train_v_filename = csv_filenames$losses_from_train_v_filename,
    png_filename = png_filenames$losses_from_train_v_filename
  )
  gcaer::plot_nmse_in_time_from_file(
    nmse_in_time_filename = csv_filenames$nmse_in_time_filename,
    png_filename = png_filenames$nmse_in_time_filename
  )
  png_filenames
}
