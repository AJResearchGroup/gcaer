#' Create a `train_times_table` to be used in testing
#'
#' Create a `train_times_table` to be used in testing
#' @return a `train_times_table`
#' @examples
#' create_test_train_times_table()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_train_times_table <- function() {
  tibble::tibble(
    epoch = seq(1, 10),
    train_time_sec = 0.1 * seq(10, 1, by = -1)
  )
}
