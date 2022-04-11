#' Check if the `model` is valid
#'
#' Check if the `model` is valid
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `model` is invalid.
#' @examples
#' # An example file
#' model_filename <- get_gcaer_filename("M0.json")
#' model <- read_model_file(model_filename)
#' check_model(model)
#'
#' if (is_gcae_installed()) {
#'   # A GCAE file
#'   model_filename <- get_gcae_model_filename("M0")
#'   model <- read_model_file(model_filename)
#'   check_model(model)
#'
#'   model_filename <- get_gcae_model_filename("M1")
#'   model <- read_model_file(model_filename)
#'   check_model(model)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_model <- function(model) {
  testthat::expect_equal(class(model), "list")
  testthat::expect_equal("layers", names(model))
  testthat::expect_equal(class(model$layers), "list")
  has_class <- purrr::map_lgl(model$layers, function(e) "class" %in% names(e))
  testthat::expect_true(all(has_class))
}
