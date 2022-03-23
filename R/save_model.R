#' Save a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso use \link{read_model_file} to read a `model` from file
#' @author Richèl J.C. Bilderbeek
#' @export
save_model <- function(
  model,
  model_filename
) {
  gcaer::check_model(model)
  gcaer::check_model_filename(model_filename)
  jsonlite::write_json(
    x = model,
    path = model_filename,
    pretty = TRUE
  )
}
