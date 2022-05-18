#' Get the filename to the GCAE model
#'
#' Get the filename to the GCAE model.
#' This function is named after the GCAE `models` folder.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @seealso
#' Use \link{get_gcae_model_filenames} to get all the
#' files with autoencoder architectures.
#'
#' To obtain the paths to the files for the different `GCAE` features:
#'  * Autoencoder architecture: use \link{get_gcae_model_filename}
#'  * Phenotypic preditcion: use \link{get_gcae_pheno_model_filename}
#'  * Training options: use \link{get_gcae_train_opts_filename}
#'  * File storage options: use \link{get_gcae_data_opts_filename}
#' @examples
#' get_gcae_model_filename(model_id = "M0")
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_model_filename <- function(
  model_id,
  gcae_options = create_gcae_options()
) {
  gcaer::check_model_id(model_id)
  gcaer::check_gcae_options(gcae_options)
  normalizePath(
    file.path(
      gcae_options$gcae_folder,
      "models",
      paste0(model_id, ".json")
    ),
    mustWork = FALSE
  )
}
