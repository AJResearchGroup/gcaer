#' Train model, and save its state at certain epochs to disk.
#'
#' Train model, and save its state at certain epochs to disk,
#' use the GCAE command-line interface
#' @inheritParams default_params_doc
gcae_train <- function(
  datadir = "example_tiny/",
  data = "HumanOrigins249_tiny",
  model_id = "M1",
  epochs = 20,
  save_interval = 2,
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

}
