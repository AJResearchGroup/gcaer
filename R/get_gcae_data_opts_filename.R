#' Get the filename to the GCAE data options
#'
#' Get the filename to the GCAE data options.
#' This function is named after the GCAE `data_opts` folder.
#' @inheritParams default_params_doc
#' @return full path to the data options' JSON file
#' @seealso
#' Use \link{get_gcae_data_opts_filenames} to get all the
#' files for the data storage options.
#'
#' Use \link{get_gcae_data_opts_ids} to get the IDs
#' of all the data storage options.
#'
#' To obtain the paths to the files for the different `GCAE` features:
#'  * Autoencoder architecture: use \link{get_gcae_model_filename}
#'  * Phenotypic prediction: use \link{get_gcae_pheno_model_filename}
#'  * Training options: use \link{get_gcae_train_opts_filename}
#'  * File storage options: use \link{get_gcae_data_opts_filename}
#' @examples
#' get_gcae_data_opts_filename(
#'   data_opts_id = "b_0_4"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_data_opts_filename <- function(
  data_opts_id,
  gcae_options = create_gcae_options()
) {
  file.path(
    gcae_options$gcae_folder,
    "data_opts",
    paste0(data_opts_id, ".json")
  )
}
