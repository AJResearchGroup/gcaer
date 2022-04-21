#' Convert a `gcae_options` to a string
#' @inheritParams default_params_doc
#' @return the `gcae_options` as a character vector,
#' with one string per `gcae_options` element
#' @examples
#' gcae_options_to_str(create_gcae_options())
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_options_to_str <- function(gcae_options) {
  gcaer::check_gcae_options(gcae_options)
  t <- tibble::tibble(
    parameter = names(gcae_options),
    value = as.character(unlist(gcae_options))
  )
  paste0(t$parameter, ": ", t$value)
}
