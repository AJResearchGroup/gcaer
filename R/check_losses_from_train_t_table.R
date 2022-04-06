#' Check if the `losses_from_train_t_table` is valid
#'
#' Check if the `losses_from_train_t_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `losses_from_train_t_table` is invalid.
#' @examples
#' losses_from_train_t_table <- create_test_losses_from_train_t_table()
#' check_losses_from_train_t_table(losses_from_train_t_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_losses_from_train_t_table <- function(losses_from_train_t_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(losses_from_train_t_table))
  testthat::expect_true("epoch" %in% names(losses_from_train_t_table))
  testthat::expect_true(
    "losses_from_train_t" %in% names(losses_from_train_t_table)
  )
  invisible(losses_from_train_t_table)
}
