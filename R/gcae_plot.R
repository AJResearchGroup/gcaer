#' Plot
#'
#' Plot, using the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_plot <- function(
  gcae_setup,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  trainedmodelname <- gcaer::get_gcae_trainedmodelname(
    gcae_setup = gcae_setup
  )
  args <- c(
    "plot",
    "--datadir", gcae_setup$datadir,
    "--trainedmodelname", trainedmodelname
  )
  if (gcae_setup$superpops != "") {
    args <- c(args, "--superpops", gcae_setup$superpops)
  }
  if (gcae_setup$pheno_model_id != "") {
    args <- c(
      args,
      "--pheno_model_id", gcae_setup$pheno_model_id
    )
  }
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  gcae_output_subfolder <- gcaer::get_gcae_output_subfolder(
    gcae_setup = gcae_setup
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
