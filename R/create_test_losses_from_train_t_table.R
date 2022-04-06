#' Create a `losses_from_train_t_table` to be used in testing
#'
#' Create a `losses_from_train_t_table` to be used in testing
#' @return a `losses_from_train_t_table`
#' @examples
#' create_test_losses_from_train_t_table()
#' check_losses_from_train_t_table(create_test_losses_from_train_t_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_losses_from_train_t_table <- function() { # nolint indeed a long function name
  tibble::tibble(
    epoch = seq(1, 2),
    losses_from_train_t = c(1255432960, 2202274304)
  )
}
