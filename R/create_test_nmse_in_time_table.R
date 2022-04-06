#' Create a `nmse_in_time_table` to be used in testing
#'
#' Create a `nmse_in_time_table` to be used in testing
#' @return a `nmse_in_time_table`
#' @examples
#' create_test_nmse_in_time_table()
#' check_nmse_in_time_table(create_test_nmse_in_time_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_nmse_in_time_table <- function() {
  tibble::tibble(
    epoch = seq(100, 1000, by = 100),
    nmse = 0.0001 * seq(100, 1000, by = 100)
  )
}
