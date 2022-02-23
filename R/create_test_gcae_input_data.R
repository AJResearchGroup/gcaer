#' Create a `gcae_input_data` to be used in testing.
#'
#' Create a `gcae_input_data` to be used in testing.
#' @return a `gcae_input_data`
#' @examples
#' gcae_input_data <- create_test_gcae_input_data()
#' check_gcae_input_data(gcae_input_data)
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_gcae_input_data <- function() {
  gcaer::read_gcae_input_files(
    gcae_input_filenames = gcaer::create_test_gcae_input_filenames()
  )
}
