#' Read a `GCAE` phenotypic model file
#' @inheritParams default_params_doc
#' @return the `pheno_model` as a JSON object,
#' as can be checked by \link{check_pheno_model}
#' @seealso
#'  * Use \link{save_pheno_model} to save a `pheno_model`
#'  * Use \link{read_model_file} to read a `model`
#' @examples
#' if (is_gcae_repo_cloned()) {
#'   # A real GCAE file
#'   pheno_model_filename <- get_gcae_pheno_model_filename("p1")
#' } else {
#'   # An example file
#'   pheno_model_filename <- get_gcaer_filename("p0.json")
#' }
#' read_pheno_model_file(pheno_model_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_pheno_model_file <- function(pheno_model_filename) {
  testthat::expect_true(file.exists(pheno_model_filename))
  gcaer::check_pheno_model_filename(pheno_model_filename)
  jsonlite::read_json(pheno_model_filename)
}
