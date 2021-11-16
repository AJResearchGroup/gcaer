#' Check if GCAE is installed
#'
#' Check if GCAE is installed. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if GCAE is not installed.
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_is_installed <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)

  has_cloned_gcae_repo <-
  if (!gcaer::has_cloned_gcae_repo(gcae_options = gcae_options)) {
    stop("GCAE repository is not cloned")
    HIERO
  }
  gcaer::check_pip_is_installed(gcae_options = gcae_options)

  if (verbose) {
    message(
      "Has cloned the GCAE repo (if it exists, GCAE is installed): ",
      has_cloned_gcae_repo
    )
  }
  has_cloned_gcae_repo


}
