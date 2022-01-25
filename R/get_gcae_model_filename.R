#' Get the filename to the GCAE model
#'
#' Get the filename to the GCAE model.
#' This function is named after the GCAE `models` folder.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_model_filename <- function(
  model_id = "M1",
  gcae_options = create_gcae_options()
) {
  file.path(
    gcae_options$gcae_folder,
    "models",
    paste0(model_id, ".json")
  )
}
