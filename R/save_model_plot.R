#' Save a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso use \link{save_model} to read the `model` to a JSON file
#' @author Richèl J.C. Bilderbeek
#' @export
save_model_plot <- function(
  model,
  png_filename
) {
  gcaer::check_model(model)
  gcaer::check_png_filename(png_filename)

  grDevices::png(png_filename, 600, 600)
  gcaer::plot_model(model = model)
  grDevices::dev.off()
  invisible(NULL)
}
