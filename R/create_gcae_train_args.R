#' Create the CLI arguments to train with GCAE
#'
#' Create the CLI arguments to train with GCAE
#' @inheritParams default_params_doc
#' @return the CLI arguments
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' args <- create_gcae_train_args(
#'   gcae_setup = gcae_setup,
#'   epochs = 1,
#'   save_interval = 1
#' )
#' # 'python3' is the path to Python3
#' # 'run_gcae.py' is the path to the GenoCAE Python script
#' full_args <- c("python3", "run_gcae.py", args)
#' cat(full_args)
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
    "--trainedmodeldir", gcae_setup$trainedmodeldir,
    paste0("--pheno_model_id=", gcae_setup$pheno_model_id)
  )
  #"--trainedmodelname", gcae_setup$trainedmodelname, # nolint not now
}
