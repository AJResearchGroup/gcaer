#' Check if the `labels_table` is valid
#'
#' Check if the `labels_table` is valid
#' Will \link{stop} if not.
#'
#' A `labels_table` is a \link[tibble]{tibble}
#' with two columns and zero, one or more rows.
#' The columns are named `super_population`
#' and `population` and expresses which population (e.g. 'The Netherlands')
#' is part of which superpopulation (e.g. 'Europe').
#' There are as much rows as there are populations.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `labels_table` is invalid.
#' @author Richèl J.C. Bilderbeek
#' @export
check_labels_table <- function(
  labels_table
) {
  testthat::expect_true(tibble::is_tibble(labels_table))
  testthat::expect_equal(2, ncol(labels_table))
  testthat::expect_equal(
    c("super_population", "population"),
    names(labels_table)
  )
}
