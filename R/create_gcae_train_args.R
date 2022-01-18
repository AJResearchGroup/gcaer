#' Create the CLI arguments to train with GCAE
#'
#' Create the CLI arguments to train with GCAE
#' @inheritParams default_params_doc
#' @return the CLI arguments
#' @examples
#' # Use the default GCAE version
#' create_gcae_options()
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_train_args <- function(
  gcae_setup,
  epochs,
  save_interval
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_epochs(epochs)
  gcaer::check_save_interval(save_interval)
  c(
    "train",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    paste0("--pheno_model_id=", gcae_setup$pheno_model_id)
  )
}
