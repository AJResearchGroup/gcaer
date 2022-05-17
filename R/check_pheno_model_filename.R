#' Check if the `pheno_model_filename` is valid
#'
#' Check if the `pheno_model_filename` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `pheno_model_filename` is invalid.
#' @seealso use \link{check_model_filename} to check if
#' an autoencoder model filename is correct
#' @examples
#' check_model_filename("p0.json")
#' check_model_filename("~/p0.json")
#' check_model_filename("/home/me/p2.json")
#' @author Richèl J.C. Bilderbeek
#' @export
check_pheno_model_filename <- function(
    pheno_model_filename
) {
  testthat::expect_equal(1, length(pheno_model_filename))
  testthat::expect_true(is.character(pheno_model_filename))
  testthat::expect_true(nchar(pheno_model_filename) > 0)
  pattern <- "^[:graph:]*p[:graph:]*\\.json$"
  if (
    !stringr::str_detect(
      string = pheno_model_filename,
      pattern = pattern
    )
  ) {
    stop(
      "'pheno_model_filename' must match regex '", pattern, ",' \n",
      "pheno_model_filename: ", pheno_model_filename
    )
  }
}
