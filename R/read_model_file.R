#' Read a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return the `model` as a JSON object,
#' as can be checked by \link{check_model}
#' @seealso use \link{save_model} to save a `model`
#' @examples
#' if (is_gcae_installed()) {
#'   model_filename <- get_gcae_model_filename("M1")
#'   model <- read_model_file(model_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
read_model_file <- function(model_filename) {
  testthat::expect_true(file.exists(model_filename))
  gcaer::check_model_filename(model_filename)
  jsonlite::read_json(model_filename)
}
