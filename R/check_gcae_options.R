#' Check if the options to run GCAE are valid.
#'
#' Check if the options to run GCAE are valid.
#' Will \link{stop} if not.
#'
#' Note that this function does not check if GCAE is actually present in
#' that folder, similar to \link{normalizePath}
#' with \code{mustWork} set to \link{FALSE}
#' @inheritParams default_params_doc
#' @return the GCAE options,
#' as can be checked by \link{check_gcae_options}
#' @examples
#' check_gcae_options(create_gcae_options())
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_options <- function(
  gcae_options
) {
  if (!is.list(gcae_options)) {
    stop(
      "'gcae_options' must be a list  \n",
      "Actual class: ", class(gcae_options), " \n",
      "Tip: use 'gcaer::create_gcae_options()'\n"
    )
  }
  testthat::expect_true("gcae_version" %in% names(gcae_options))
  testthat::expect_equal(
    length(names(gcae_options)),
    length(unique(names(gcae_options)))
  )
  gcaer::check_gcae_version(gcae_options$gcae_version)
}
