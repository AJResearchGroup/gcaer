#' Check if the `losses_from_train_v_table` is valid
#'
#' Check if the `losses_from_train_v_table` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if `losses_from_train_v_table` is invalid.
#' @examples
#' losses_from_train_v_table <- create_test_losses_from_train_v_table()
#' check_losses_from_train_v_table(losses_from_train_v_table)
#' @author Richèl J.C. Bilderbeek
#' @export
check_losses_from_train_v_table <- function(losses_from_train_v_table) { # nolint indeed a long function name
  testthat::expect_true(tibble::is_tibble(losses_from_train_v_table))
  testthat::expect_true("epoch" %in% names(losses_from_train_v_table))
  testthat::expect_true(
    "losses_from_train_v" %in% names(losses_from_train_v_table)
  )
  invisible(losses_from_train_v_table)
}
