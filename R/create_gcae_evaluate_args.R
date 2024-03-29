#' Create the CLI arguments to evaluate the `GCAE` training
#'
#' Create the CLI arguments to evaluate the `GCAE` training
#' @inheritParams default_params_doc
#' @return the CLI arguments
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' args <- create_gcae_evaluate_args(
#'   gcae_setup = gcae_setup,
#'   metrics = "f1_score_3",
#'   epoch = 123
#' )
#' # 'python3' is the path to Python3
#' # 'run_gcae.py' is the path to the GenoCAE Python script
#' full_args <- c("python3", "run_gcae.py", args)
#' cat(full_args)
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_evaluate_args <- function(
  gcae_setup,
  metrics,
  epoch
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_metrics(metrics)
  gcaer::check_epoch(epoch)
  if (gcae_setup$superpops == "") {
    stop("To run GCAE's 'evaluate' function, one needs a file with labels")
  }
  args <- c(
    "evaluate",
    "--datadir", gcae_setup$datadir,
    "--metrics", metrics,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    "--epoch", epoch,
    "--trainedmodeldir", gcae_setup$trainedmodeldir
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
  args
}
