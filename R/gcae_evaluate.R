#' Use `GCAE` its evaluate
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_evaluate <- function(
  gcae_setup,
  gcae_options,
  metrics,
  epoch,
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_metrics(metrics)
  gcaer::check_epoch(epoch)
  args <- gcaer::create_gcae_evaluate_args(
    gcae_setup = gcae_setup,
    metrics = metrics,
    epoch = epoch
  )
  if (verbose) {
    message(
      "Running GCAE with arguments: '", paste0(args, collapse = " "), " \n",
      "Tip: you should be able to copy-paste this :-)"
    )
  }
  output <- gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  if (verbose) {
    message("GCAE output: \n", paste0(output, collapse = "\n"))
  }

  # writing F1 scores to:
  #  * [trainingdir]/[datadir]/f1_scores_pops_epoch_1.csv
  #  * [trainingdir]/[datadir]/f1_score_3.csv
  # etcetera
  #
  # For example, to:
  #  * full: /home/richel/.cache/gcaer/ae_out2b8b36b09a52/ae.M0.ex3.b_0_4.gcae_input_files_1.p2/gcae_input_files_1/f1_scores_pops_epoch_1.csv # nolint indeed a long line
  #  * full: [temporary folder name  ]/ae.M0.ex3.b_0_4.gcae_input_files_1.p2/gcae_input_files_1/f1_scores_pops_epoch_1.csv # nolint indeed a long line

  gcae_output_subfolder <- gcaer::get_gcae_output_subfolder(
    gcae_setup = gcae_setup
  )
  testthat::expect_true(dir.exists(gcae_output_subfolder))
  gcae_plot_subfolder <- file.path(gcae_output_subfolder, gcae_setup$data)
  testthat::expect_true(dir.exists(gcae_plot_subfolder))

  evaluate_filenames <- list.files(
    gcae_plot_subfolder,
    full.names = TRUE,
    recursive = TRUE,
    pattern = ".*f1_score.*\\.csv$"
  )
  evaluate_filenames
}
