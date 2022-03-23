#' Determine if two JSON objects are the same
#' @param json_1 a JSON object, as returned by \link[jsonlite]{read_json}
#' @param json_2 a JSON object, as returned by \link[jsonlite]{read_json}
#' @return \link{TRUE} if the objects are the same
#' @examples
#' if (is_gcae_installed()) {
#'   m0 <- read_model_file(get_gcae_model_filename("M0"))
#'   m1 <- read_model_file(get_gcae_model_filename("M1"))
#'   is_equal_json(m0, m1)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_equal_json <- function(json_1, json_2) {
  testthat::expect_equal("list", class(json_1))
  testthat::expect_equal("list", class(json_2))
  if (length(json_1) != length(json_2)) return(FALSE)
  json_1_unlist <- unlist(json_1)
  json_2_unlist <- unlist(json_2)
  if (length(json_1_unlist) != length(json_2_unlist)) return(FALSE)
  all(json_1_unlist == json_2_unlist)
}
