#' Check if the `labels_table` is valid
#'
#' Check if the `labels_table` is valid
#' Will \link{stop} if not.
#'
#' A `labels_table` is a \link[tibble]{tibble}
#' with two columns and zero, one or more rows.
#' The columns are named `population`
#' and `super_population`
#' and expresses which population (e.g. 'The Netherlands')
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
    names(labels_table),
    c("population", "super_population")
  )
  t <- table(labels_table$population)
  is_duplicate <- as.integer(t) != 1
  if (any(is_duplicate)) {
    stop(
      "All populations must be unique. \n",
      "Duplicated populations: ",
      paste0(names(t)[is_duplicate], collapse = ", "), " \n",
      "Counts: ",
      paste0(as.integer(t)[is_duplicate], collapse = ", ")
    )
  }
}
