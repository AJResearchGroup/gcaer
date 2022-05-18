#' Get the filename to the `GCAE` phenotype model
#'
#' Get the filename to the `GCAE` model.
#' This function is named after the GCAE `pheno_model_id` flag.
#' @inheritParams default_params_doc
#' @return full paths to the created files

#' @seealso
#' Use \link{get_gcae_pheno_model_filenames} to get all the
#' files for the phenotypic prediction architectures.
#'
#' Use \link{get_gcae_pheno_model_ids} to get the IDs
#' of all phenotypic prediction architectures.
#'
#' To obtain the paths to the files for the different `GCAE` features:
#'  * Autoencoder architecture: use \link{get_gcae_model_filename}
#'  * Phenotypic prediction: use \link{get_gcae_pheno_model_filename}
#'  * Training options: use \link{get_gcae_train_opts_filename}
#'  * File storage options: use \link{get_gcae_data_opts_filename}
#' @examples
#' get_gcae_pheno_model_filename()
#' get_gcae_pheno_model_filename(pheno_model_id = "p0")
#' get_gcae_pheno_model_filename(pheno_model_id = "p1")
#' get_gcae_pheno_model_filename(pheno_model_id = "p2")
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_pheno_model_filename <- function(
  pheno_model_id = "p0",
  gcae_options = create_gcae_options()
) {
  gcaer::check_pheno_model_id(pheno_model_id)
  file.path(
    gcae_options$gcae_folder,
    "models",
    paste0(pheno_model_id, ".json")
  )
}
