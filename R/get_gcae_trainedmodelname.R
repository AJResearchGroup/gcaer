#' Get the GCAE `trainedmodelname`
#'
#' Get the GCAE trained model name,
#' to be used by the GCAE`--trainedmodelname` CLI flag
#' @inheritParams default_params_doc
#' @return the GCAE trained model name
#' @examples
#' get_gcae_trainedmodelname(
#'   data = "HumanOrigins249_tiny",
#'   gcae_setup = create_gcae_setup()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_trainedmodelname <- function(
  data,
  gcae_setup = create_gcae_setup()
) {
  gcaer::check_data(data)
  gcaer::check_gcae_setup(gcae_setup)
  trainedmodelname <- paste0(
    "ae.", gcae_setup$model_id, ".",
    gcae_setup$train_opts_id, ".",
    gcae_setup$data_opts_id, ".",
    data
  )
  trainedmodelname
}
