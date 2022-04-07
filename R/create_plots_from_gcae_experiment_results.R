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
  filenames <- gcaer::get_gcae_experiment_results_filenames(
    folder_name = folder_name
  )
  gcaer::plot_scores_per_pop_from_file(
    scores_per_pop_filename = filenames$scores_per_pop_filename,
    png_filename = stringr::str_replace(
      filenames$scores_per_pop_filename, ".csv", ".png"
    )
  )
  gcaer::plot_scores_from_file(
    scores_filename = filenames$scores_filename,
    png_filename = stringr::str_replace(
      filenames$scores_filename, ".csv", ".png"
    )
  )
  gcaer::plot_genotype_concordances_from_file(
    genotype_concordances_filename = filenames$genotype_concordances_filename,
    png_filename = stringr::str_replace(
      filenames$genotype_concordances_filename, ".csv", ".png"
    )
  )
  gcaer::plot_phenotype_predictions_from_file(
    phenotype_predictions_filename = filenames$phenotype_predictions_filename,
    png_filename = stringr::str_replace(
      filenames$phenotype_predictions_filename, ".csv", ".png"
    )
  )
  gcaer::plot_train_times_from_file(
    train_times_filename = filenames$train_times_filename,
    png_filename = stringr::str_replace(
      filenames$train_times_filename, ".csv", ".png"
    )
  )
  gcaer::plot_losses_from_train_t_from_file(
    losses_from_train_t_filename = filenames$losses_from_train_t_filename,
    png_filename = stringr::str_replace(
      filenames$losses_from_train_t_filename, ".csv", ".png"
    )
  )
  gcaer::plot_losses_from_train_v_from_file(
    losses_from_train_v_filename = filenames$losses_from_train_v_filename,
    png_filename = stringr::str_replace(
      filenames$losses_from_train_v_filename, ".csv", ".png"
    )
  )
  gcaer::plot_nmse_in_time_from_file(
    nmse_in_time_filename = filenames$nmse_in_time_filename,
    png_filename = stringr::str_replace(
      filenames$nmse_in_time_filename, ".csv", ".png"
    )
  )
}
