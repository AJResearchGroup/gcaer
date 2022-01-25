#' Get the path to the GCAE output folder
#'
#' Get the path to the GCAE output folder.
#' This folder contains the output of multiple models.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @examples
#' get_gcae_output_folder()
#' get_gcae_output_folder(create_gcae_options())
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_output_folder <- function(
  gcae_options = create_gcae_options()
) {
  ae_out_folder <- file.path(
    gcae_options$gcae_folder,
    "ae_out"
  )
  ae_out_folder
}
