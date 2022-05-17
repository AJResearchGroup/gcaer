#' Read a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return the `model` as a JSON object,
#' as can be checked by \link{check_model}
#' @seealso
#'  * Use \link{save_model} to save a `model`
#'  * Use \link{read_pheno_model_file} to read a `pheno_model`
#' @examples
#' if (is_gcae_repo_cloned()) {
#'   # A real GCAE file
#'   model_filename <- get_gcae_model_filename("M1")
#' } else {
#'   # An example file
#'   model_filename <- get_gcaer_filename("M0.json")
#' }
#' read_model_file(model_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_model_file <- function(model_filename) {
  testthat::expect_true(file.exists(model_filename))
  gcaer::check_model_filename(model_filename)
  jsonlite::read_json(model_filename)
}
