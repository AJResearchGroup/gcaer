#' Check if the `model_filename` is valid
#'
#' Check if the `model_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `model_filename` is invalid.
#' @seealso use \link{check_pheno_model_filename} to check if
#' a phenotype model filename is correct
#' @examples
#' check_model_filename("M0.json")
#' check_model_filename("~/M0.json")
#' check_model_filename("/home/me/M2.json")
#' @author Richèl J.C. Bilderbeek
#' @export
check_model_filename <- function(
  model_filename
) {
  testthat::expect_equal(1, length(model_filename))
  testthat::expect_true(is.character(model_filename))
  testthat::expect_true(nchar(model_filename) > 0)
  pattern <- "^[:graph:]*M[:graph:]*\\.json$"
  if (
    !stringr::str_detect(
      string = model_filename,
      pattern = pattern
    )
  ) {
    stop(
      "'model_filename' must match regex '", pattern, ",' \n",
      "model_filename: ", model_filename
    )
  }
}
