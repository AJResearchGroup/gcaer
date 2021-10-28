#' Determine if `GCAE` is installed
#' @inheritParams default_params_doc
#' @return `TRUE` if `GCAE` is installed
#' @examples
#' is_gcae_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_gcae_installed <- function(
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_options(gcae_options)
  has_cloned_gcae_repo <- gcaer::has_cloned_gcae_repo(
    gcae_options = gcae_options
  )
  if (!has_cloned_gcae_repo) {
    return(FALSE)
  }
  if (verbose) {
    message(
      "Has cloned the GCAE repo (if it exists, GCAE is installed): ",
      has_cloned_gcae_repo
    )
  }
  has_cloned_gcae_repo
}
