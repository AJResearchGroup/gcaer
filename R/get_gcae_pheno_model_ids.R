#' Get the `pheno_model` IDs for all the `GCAE` phenotype architectures
#'
#' Get the `pheno_model` IDs for all the `GCAE` phenotype architectures.
#'
#' @inheritParams default_params_doc
#' @return the `pheno_model` IDs of the `GCAE` phenotype architectures
#' @seealso
#' Use \link{get_gcae_model_ids} to get the IDs for the
#' autoencoder models.
#' @examples
#' get_gcae_pheno_model_ids()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_pheno_model_ids <- function(
  gcae_options = create_gcae_options()
) {
  # 'get_gcae_pheno_model_filenames' will check 'gcae_options'
  gcae_pheno_model_filenames <- gcaer::get_gcae_pheno_model_filenames(
    gcae_options = gcae_options
  )
  if (length(gcae_pheno_model_filenames) == 0) {
    return(gcae_pheno_model_filenames)
  }
  matches <- stringr::str_match(
    string = gcae_pheno_model_filenames,
    pattern = ".*models/(p.*)\\.json"
  )
  testthat::expect_false(is.na(matches[1, 1]))
  matches[, 2]
}
