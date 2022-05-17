#' Get the path to the GCAE output subfolder
#'
#' Get the path to the GCAE output subfolder.
#' This subfolder contains the output of one model
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @examples
#' gcae_setup <- create_test_gcae_setup()
#' get_gcae_output_subfolder(gcae_setup = gcae_setup)
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_output_subfolder <- function(
  gcae_setup
) {
  gcaer::check_gcae_setup(gcae_setup)
  ae_out_subfolder <- file.path(
    paste0(
      gcae_setup$trainedmodeldir,
      "ae.",
      gcae_setup$model_id, ".",
      gcae_setup$train_opts_id, ".",
      gcae_setup$data_opts_id, ".",
      gcae_setup$data
    )
  )
  if (gcae_setup$pheno_model_id != "") {
    ae_out_subfolder <- c(
      ae_out_subfolder,
      ".",
      gcae_setup$pheno_model_id
    )
  }
  ae_out_subfolder
}
