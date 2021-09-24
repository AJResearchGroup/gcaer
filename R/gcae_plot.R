#' Plot
#'
#' Plot, using the GCAE command-line interface
#' @inheritParams default_params_doc
#' @param superpops path to the superpops file.
#' This argument is named after the GCAE `--superpops` CLI flag.
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_plot <- function(
  superpops = file.path(datadir, "HO_superpopulations"),
  gcae_setup = create_gcae_setup(),
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  testthat::expect_true(file.exists(superpops))
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  trainedmodelname <- gcaer::get_gcae_trainedmodelname(
    gcae_setup = gcae_setup
  )
  args <- c(
    "plot",
    "--datadir", gcae_setup$datadir,
    "--trainedmodelname", trainedmodelname,
    "--superpops", superpops
  )
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  gcae_output_subfolder <- gcaer::get_gcae_output_subfolder(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  testthat::expect_true(dir.exists(gcae_output_subfolder))
  gcae_plot_subfolder <- file.path(gcae_output_subfolder, gcae_setup$data)
  testthat::expect_true(dir.exists(gcae_plot_subfolder))
  plot_filenames <- list.files(
    gcae_plot_subfolder,
    full.names = TRUE,
    recursive = TRUE
  )
  plot_filenames
}
