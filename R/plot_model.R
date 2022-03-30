#' Save a `GCAE` autoencoder architecture file
#' @inheritParams default_params_doc
#' @return Nothing
#' @seealso use \link{read_model_file} to read a `model` from file
#' @author Richèl J.C. Bilderbeek
#' @export
plot_model <- function(model) {
  gcaer::check_model(model)

  # STUB: use those from the model
  links <- data.frame(
    source = c("A", "A", "A", "A", "A", "F", "B"),
    target = c("B", "B", "C", "D", "F", "A", "E")
  )
  network <- igraph::graph_from_data_frame(d = links, directed = TRUE)

  igraph::plot.igraph(network)
}
