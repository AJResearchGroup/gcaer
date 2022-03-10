#' Check if the `metrics` is valid
#'
#' Check if the `metrics` is valid
#' Will \link{stop} if not.
#'
#' `metrics` is a comma-separated list of `metric`,
#' as checked by \link{check_metric}
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `metrics` is invalid.
#' @examples
#' check_metrics("hull_error")
#' check_metrics("f1_score_3")
#' check_metrics("hull_error,f1_score_3")
#' @author Richèl J.C. Bilderbeek
#' @export
check_metrics <- function(
  metrics
) {
  testthat::expect_equal(1, length(metrics))
  testthat::expect_true(is.character(metrics))
  metric_vector <- stringr::str_split(metrics, pattern = ",")[[1]]
  for (metric in metric_vector) {
    gcaer::check_metric(metric)
  }
  invisible(metrics)
}
