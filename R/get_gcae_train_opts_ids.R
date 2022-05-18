#' Get the `train_opts` IDs for all the `GCAE` phenotype architectures
#'
#' Get the `train_opts` IDs for all the `GCAE` phenotype architectures.
#'
#' @inheritParams default_params_doc
#' @return the `train_opts` IDs of the `GCAE` phenotype architectures
#' @seealso
#' Use \link{get_gcae_model_ids} to get the IDs for the
#' autoencoder models.
#' @examples
#' get_gcae_train_opts_ids()
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_train_opts_ids <- function(
  gcae_options = create_gcae_options()
) {
  # 'get_gcae_train_opts_filenames' will check 'gcae_options'
  gcae_train_opts_filenames <- gcaer::get_gcae_train_opts_filenames(
    gcae_options = gcae_options
  )
  if (length(gcae_train_opts_filenames) == 0) {
    return(gcae_train_opts_filenames)
  }
  matches <- stringr::str_match(
    string = gcae_train_opts_filenames,
    pattern = "train_opts/(.*)\\.json"
  )
  testthat::expect_false(is.na(matches[1, 1]))
  matches[, 2]
}
