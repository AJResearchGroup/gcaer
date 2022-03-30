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
#' as can be checked by \link{check_gcae_experiment_params}
#' @examples
#' gcae_experiment_params <- create_gcae_experiment_params(
#'   gcae_options = create_gcae_options(),
#'   gcae_setup = create_test_gcae_setup(),
#'   analyse_epochs = seq(1, 2, 3),
#'   metrics = "f1_score_3,f1_score_5"
#' )
#' check_gcae_experiment_params(gcae_experiment_params)
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_experiment_params <- function(
  gcae_experiment_params
) {
  if (!is.list(gcae_experiment_params)) {
    stop(
      "'gcae_experiment_params' must be a list  \n",
      "Actual class: ", class(gcae_experiment_params), " \n",
      "Tip: use 'gcaer::create_gcae_experiment_params()'\n"
    )
  }
  testthat::expect_true("gcae_options" %in% names(gcae_experiment_params))
  testthat::expect_true("gcae_setup" %in% names(gcae_experiment_params))
  testthat::expect_true("analyse_epochs" %in% names(gcae_experiment_params))
  testthat::expect_true("metrics" %in% names(gcae_experiment_params))

  gcaer::check_gcae_options(gcae_experiment_params$gcae_options)
  gcaer::check_gcae_setup(gcae_experiment_params$gcae_setup)
  gcaer::check_analyse_epochs(gcae_experiment_params$analyse_epochs)
  gcaer::check_metrics(gcae_experiment_params$metrics)

  invisible(gcae_experiment_params)
}
