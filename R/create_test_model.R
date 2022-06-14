#' Create a GCAE model to be used in testing
#'
#' Create a GCAE model to be used in testing
#' @inheritParams default_params_doc
#' @return a GCAE model
#' @examples
#' create_test_model()
#' check_model(create_test_model())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_model <- function(
  model_filename = gcaer::get_gcaer_filename("M0.json")
) {
  gcaer::read_model_file(model_filename)
}
