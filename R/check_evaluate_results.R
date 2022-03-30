#' Check if the `evaluate_results` are valid.
#'
#' Check if the `evaluate_results` are valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' evaluate_filenames <- c(
#'   get_gcaer_filename("f1_score_3.csv"),
#'   get_gcaer_filename("f1_score_5.csv"),
#'   get_gcaer_filename("f1_scores_pops_epoch_1.csv")
#' )
#' evaluate_results <- parse_evaluate_filenames(
#'   evaluate_filenames = evaluate_filenames,
#'   epoch = 1
#' )
#' check_evaluate_results(evaluate_results)
#' @author Richèl J.C. Bilderbeek
#' @export
check_evaluate_results <- function(evaluate_results) {
  testthat::expect_true(is.list(evaluate_results))
  testthat::expect_true("t_scores_per_pop" %in% names(evaluate_results))
  testthat::expect_true("t_scores" %in% names(evaluate_results))
  invisible(evaluate_results)
}
