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
#' gcae_setup <- create_test_gcae_setup()
#' check_gcae_setup(gcae_setup)
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
  testthat::expect_true("trainedmodeldir" %in% names(gcae_setup))
  #testthat::expect_true("trainedmodelname" %in% names(gcae_setup)) # nolint removed for now

  gcaer::check_model_id(gcae_setup$model_id)
  gcaer::check_train_opts_id(gcae_setup$train_opts_id)
  gcaer::check_data_opts_id(gcae_setup$data_opts_id)
  gcaer::check_data(gcae_setup$data)
  gcaer::check_datadir(gcae_setup$datadir)
  gcaer::check_trainedmodeldir(gcae_setup$trainedmodeldir)
  #gcaer::check_trainedmodelname(gcae_setup$trainedmodelname) # nolint removed for now
}
