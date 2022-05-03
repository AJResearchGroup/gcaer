#' Check if the `metric` is valid
#'
#' Check if the `metric` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `metric` is invalid.
#' @examples
#' check_metric("hull_error")
#' check_metric("f1_score_3")
#' check_metric("f1_score_5")
#' @author Richèl J.C. Bilderbeek
#' @export
check_metric <- function(
  metric
) {
  testthat::expect_equal(1, length(metric))
  testthat::expect_true(is.character(metric))
  if (metric == "") return(invisible(metric))
  if (metric == "hull_error") return(invisible(metric))
  if (stringr::str_count(metric, "^f1_score_[[:digit:]]+$") == 1) {
    return(invisible(metric))
  }
  stop("Unknown value of 'metric': ", metric)
}
