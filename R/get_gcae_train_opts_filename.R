#' Get the filename to the GCAE training options
#'
#' Get the filename to the GCAE training options.
#' This function is named after the GCAE `train_opts` folder.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @seealso
#' Use \link{get_gcae_train_opts_filenames} to get all the
#' files with training options.
#'
#' To obtain the paths to the files for the different `GCAE` features:
#'  * Autoencoder architecture: use \link{get_gcae_model_filename}
#'  * Phenotypic preditcion: use \link{get_gcae_pheno_model_filename}
#'  * Training options: use \link{get_gcae_train_opts_filename}
#'  * File storage options: use \link{get_gcae_data_opts_filename}
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_train_opts_filename <- function(
  train_opts_id,
  gcae_options = create_gcae_options()
) {
  file.path(
    gcae_options$gcae_folder,
    "train_opts",
    paste0(train_opts_id, ".json")
  )
}
