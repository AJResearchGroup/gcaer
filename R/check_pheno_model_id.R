#' Check if the `pheno_model_id` is valid
#'
#' Check if the `pheno_model_id` is valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if `pheno_model_id` is invalid.
#' @seealso Use \link{check_model_id} to check if a `model_id`
#' is valid
#' @examples
#' check_pheno_model_id("p0")
#' check_pheno_model_id("p1")
#' check_pheno_model_id("p2")
#'
#' check_pheno_model_id("") # Use no phenotype prediction
#' @author Richèl J.C. Bilderbeek
#' @export
check_pheno_model_id <- function(
  pheno_model_id
) {
  testthat::expect_equal(1, length(pheno_model_id))
  testthat::expect_true(is.character(pheno_model_id))
  testthat::expect_true(nchar(pheno_model_id) >= 0)
  testthat::expect_true(nchar(pheno_model_id) != 1)
  if (pheno_model_id != "") {
    testthat::expect_equal("p", substr(pheno_model_id, 1, 1))
  }
}
