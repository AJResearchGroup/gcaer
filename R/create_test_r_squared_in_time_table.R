#' Create a `r_squared_in_time_table` to be used in testing
#'
#' Create a `r_squared_in_time_table` to be used in testing
#' @return a `r_squared_in_time_table`
#' @examples
#' create_test_r_squared_in_time_table()
#' check_r_squared_in_time_table(create_test_r_squared_in_time_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_r_squared_in_time_table <- function() { # nolint indeed a long function name
  tibble::tibble(
    epoch = seq(100, 1000, by = 100),
    r_squared = 0.0001 * seq(100, 1000, by = 100)
  )
}
