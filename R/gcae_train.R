#' Train model, and save its state at certain epochs to disk.
#'
#' Train model, and save its state at certain epochs to disk,
#' use the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_train <- function(
  datadir = "example_tiny/",
  data = "HumanOrigins249_tiny",
  model_id = "M1",
  epochs = 1,
  save_interval = 1,
  train_opts_id = "ex3",
  data_opts_id = "b_0_4",
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  args <- c(
    "train",
    "--datadir", datadir,
    "--data", data,
    "--model_id", model_id,
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", train_opts_id,
    "--data_opts_id", data_opts_id
  )
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  ae_out_folder <- file.path(
    get_gcae_subfolder(gcae_options = gcae_options),
    "ae_out"
  )
  testthat::expect_true(dir.exists(ae_out_folder))
  ae_out_subfolder <- file.path(
    ae_out_folder,
    paste0("ae.", model_id, ".", train_opts_id, ".", data_opts_id, ".", data)
  )
  testthat::expect_true(dir.exists(ae_out_subfolder))
  list.files(path = ae_out_subfolder, full.names = TRUE, recursive = TRUE)


}
