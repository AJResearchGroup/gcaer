#' Get the filenames for all the `GCAE` phenotypic model architectures
#'
#' Get the filenames for all the `GCAE` phenotypic model architectures.
#' @inheritParams default_params_doc
#' @return full paths to all the `GCAE` phenotypic model architectures filenames
#' @seealso use \link{get_gcae_model_filename} to get the filename
#' of one `GCAE` autoencoder architecture
#'
#' Use \link{get_gcae_model_filenames} to get the filenames for the
#' autoencoder models.
#' @examples
#' get_gcae_train_opts_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_train_opts_filenames <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  list.files(
    path = file.path(gcae_options$gcae_folder, "train_opts"),
    pattern = ".*\\.json",
    full.names = TRUE
  )
}
