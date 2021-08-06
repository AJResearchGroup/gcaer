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
#' as can be checked by \link{check_gcae_setup}
#' @examples
#' check_gcae_setup(create_gcae_setup())
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_setup <- function(
  gcae_setup
) {
  if (!is.list(gcae_setup)) {
    stop(
      "'gcae_setup' must be a list  \n",
      "Actual class: ", class(gcae_setup), " \n",
      "Tip: use 'gcaer::create_gcae_setup()'\n"
    )
  }
  testthat::expect_true("model_id" %in% names(gcae_setup))
  testthat::expect_true("train_opts_id" %in% names(gcae_setup))
  testthat::expect_true("data_opts_id" %in% names(gcae_setup))
  testthat::expect_true("datadir" %in% names(gcae_setup))
  testthat::expect_true("data" %in% names(gcae_setup))
  testthat::expect_true("trainedmodelname" %in% names(gcae_setup))

  testthat::expect_equal(1, length(gcae_setup$model_id))
  testthat::expect_equal(1, length(gcae_setup$train_opts_id))
  testthat::expect_equal(1, length(gcae_setup$data_opts_id))
  testthat::expect_equal(1, length(gcae_setup$datadir))
  testthat::expect_equal(1, length(gcae_setup$data))
  testthat::expect_equal(1, length(gcae_setup$trainedmodelname))

  testthat::expect_true(is.character(gcae_setup$model_id))
  testthat::expect_true(is.character(gcae_setup$train_opts_id))
  testthat::expect_true(is.character(gcae_setup$data_opts_id))
testthat::expect_true(is.character(gcae_setup$datadir))
testthat::expect_true(is.character(gcae_setup$data))
testthat::expect_true(is.character(gcae_setup$trainedmodelname))

  testthat::expect_true(nchar(gcae_setup$model_id) >= 1)
  testthat::expect_true(nchar(gcae_setup$train_opts_id) >= 1)
  testthat::expect_true(nchar(gcae_setup$data_opts_id) >= 1)
  testthat::expect_true(nchar(gcae_setup$datadir) >= 1)
  testthat::expect_true(nchar(gcae_setup$data) >= 1)
  testthat::expect_true(nchar(gcae_setup$trainedmodelname) >= 1)
}
