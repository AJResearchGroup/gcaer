#' Get the filename to the GCAE model
#'
#' Get the filename to the GCAE model.
#' This function is named after the GCAE `models` folder.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @seealso use \link{get_gcae_pheno_model_filename} to get the filename
#' to a phenotype model.
#' @examples
#' get_gcae_model_filename()
#' get_gcae_model_filename(model_id = "M0")
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_model_filename <- function(
  model_id = "M0",
  gcae_options = create_gcae_options()
) {

  file.path(
    gcae_options$gcae_folder,
    "models",
    paste0(model_id, ".json")
  )
}
