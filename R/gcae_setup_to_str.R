#' Convert a `gcae_setup` to a string
#' @inheritParams default_params_doc
#' @return the `gcae_setup` as a character vector,
#' with one string per `gcae_setup` element
#' @examples
#' gcae_setup_to_str(create_test_gcae_setup())
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_setup_to_str <- function(gcae_setup) {
  gcaer::check_gcae_setup(gcae_setup)
  t <- tibble::tibble(
    parameter = names(gcae_setup),
    value = as.character(unlist(gcae_setup))
  )
  paste0(t$parameter, ": ", t$value)
}
