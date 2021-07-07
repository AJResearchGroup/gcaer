#' Project
#'
#' Project, using the GCAE command-line interface
#' @inheritParams default_params_doc
#' @param superpops path to the superpops file.
#' This argument is named after the GCAE `--superpops` CLI flag.
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_project <- function(
  datadir = "example_tiny/",
  data = "HumanOrigins249_tiny",
  superpops = file.path(datadir, "HO_superpopulations"),
  gcae_setup = create_gcae_setup(),
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  testthat::expect_true(file.exists(superpops))
  # python3 run_gcae.py project --datadir example_tiny/ --data HumanOrigins249_tiny --model_id M1 --train_opts_id ex3  --data_opts_id b_0_4 --superpops example_tiny/HO_superpopulations
  args <- c(
    "project",
    "--datadir", datadir,
    "--data", data,
    "--model_id", gcae_setup$model_id,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    "--superpops", superpops
  )
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
}
