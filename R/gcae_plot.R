#' Plot
#'
#' Plot, using the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_plot <- function(
  datadir = "example_tiny/",
  data = "HumanOrigins249_tiny",
  gcae_setup = create_gcae_setup(),
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  args <- c(
    "plot",
    "--datadir", datadir,
    "--data", data,
    "--model_id", gcae_setup$model_id,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id
  )
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )

}
