#' Check if the `model_id` is valid
#'
#' Check if the `model_id` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `model_id` is invalid.
#' @seealso Use \link{check_pheno_model_id} to check if a `pheno_model_id`
#' is valid
#' @examples
#' check_model_id("M1")
#' @author Richèl J.C. Bilderbeek
#' @export
check_model_id <- function(
  model_id
) {
  testthat::expect_equal(1, length(model_id))
  testthat::expect_true(is.character(model_id))
  testthat::expect_true(nchar(model_id) > 0)
}
