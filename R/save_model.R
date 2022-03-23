#' Save a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso
#' Use \link{read_model_file} to read a `model` from file
#' Use \link{save_model_plot} to save the `model` plot.
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
