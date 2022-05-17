#' Get the filenames for all the `GCAE` autoencoder architectures
#'
#' Get the filenames for all the `GCAE` autoencoder architectures.
#'
#' This function is named after the GCAE `models` folder,
#' although the phenotypic prediction models
#' (that can be obtained using \link{get_gcae_pheno_model_filenames})
#' are stored there as well.
#' @inheritParams default_params_doc
#' @return full paths to all the `GCAE` autoencoder architectures filenames
#' @seealso use \link{get_gcae_model_filename} to get the filename
#' of one `GCAE` autoencoder architecture
#'
#' Use \link{get_gcae_pheno_model_filenames} to get the filenames for the
#' phenotypic models.
#' @examples
#' get_gcae_model_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_model_filenames <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  list.files(
    path = file.path(gcae_options$gcae_folder, "models"),
    pattern = "M.*\\.json",
    full.names = TRUE
  )
}
