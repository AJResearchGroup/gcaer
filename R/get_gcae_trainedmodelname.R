#' Get the GCAE `trainedmodelname`
#'
#' Get the GCAE trained model name,
#' to be used by the GCAE`--trainedmodelname` CLI flag
#' @inheritParams default_params_doc
#' @return the GCAE trained model name
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' get_gcae_trainedmodelname(gcae_setup)
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_trainedmodelname <- function(
  gcae_setup
) {
  gcaer::check_gcae_setup(gcae_setup)
  trainedmodelname <- paste0(
    "ae.", gcae_setup$model_id, ".",
    gcae_setup$train_opts_id, ".",
    gcae_setup$data_opts_id, ".",
    gcae_setup$data, ".",
    gcae_setup$pheno_model_id
  )
  trainedmodelname
}
