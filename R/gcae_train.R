#' Train model, and save its state at certain epochs to disk.
#'
#' Train model, and save its state at certain epochs to disk,
#' use the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_train <- function(
  gcae_setup = create_gcae_setup(),
  epochs = 1,
  save_interval = 1,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_epochs(epochs)
  gcaer::check_save_interval(save_interval)
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)

  args <- c(
    "train",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id
  )
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  ae_out_subfolder <- get_gcae_output_subfolder(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  testthat::expect_true(dir.exists(ae_out_subfolder))
  train_filenames <- list.files(
    path = ae_out_subfolder,
    full.names = TRUE,
    recursive = TRUE
  )
  train_filenames
}
