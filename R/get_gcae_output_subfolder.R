#' Get the path to the GCAE output subfolder
#'
#' Get the path to the GCAE output subfolder.
#' This subfolder contains the output of one model
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @examples
#' get_gcae_output_subfolder(
#'   gcae_setup = create_gcae_setup(
#'     datadir = "my_datadir/",
#'     data = "HumanOrigins249_tiny"
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_output_subfolder <- function(
  gcae_setup,
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  ae_out_folder <- gcaer::get_gcae_output_folder(gcae_options = gcae_options)
  ae_out_subfolder <- file.path(
    ae_out_folder,
    paste0(
      "ae.",
      gcae_setup$model_id, ".",
      gcae_setup$train_opts_id, ".",
      gcae_setup$data_opts_id, ".",
      gcae_setup$data
    )
  )
  ae_out_subfolder
}
