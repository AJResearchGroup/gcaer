#' Get the model IDs for all the `GCAE` autoencoder architectures
#'
#' Get the model IDs for all the `GCAE` autoencoder architectures.
#'
#' This function is named after the GCAE `models` folder,
#' although the phenotypic prediction models
#' (that can be obtained using \link{get_gcae_pheno_model_ids})
#' are stored there as well.
#' @inheritParams default_params_doc
#' @return zero, one or more model IDs of the `GCAE`
#' autoencoder architectures available.
#' @seealso
#' Use \link{get_gcae_pheno_model_ids} to get the IDs for the
#' phenotypic models.
#' @examples
#' get_gcae_model_ids()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_model_ids <- function(
  gcae_options = create_gcae_options()
) {
  # 'get_gcae_model_filenames' will check 'gcae_options'
  gcae_model_filenames <- gcaer::get_gcae_model_filenames(
    gcae_options = gcae_options
  )
  if (length(gcae_model_filenames) == 0) return(gcae_model_filenames)
  matches <- stringr::str_match(
    string = gcae_model_filenames,
    pattern = ".*models/(M.*)\\.json"
  )
  testthat::expect_false(is.na(matches[1, 1]))
  matches[, 2]
}
