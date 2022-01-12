#' Check if the arguments to call GCAE are valid.
#'
#' Check if the arguments to call GCAE are valid.
#' Will \link{stop} if not.
#'
#' This function is as lenient as possible.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the arguments to call GCAE are valid.
#' @examples
#' check_gcae_args("--help")
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_args <- function(args) {
  testthat::expect_true(is.character(args))
  invalid_args_indices <- stringr::str_which(args, "--help", negate = TRUE)
  if (length(invalid_args_indices) != 0) {
    stop(
      "Error in argument(s) ",
      paste0(invalid_args_indices, collate = ","),
      " with text ",
      paste0(args[invalid_args_indices], collate = ",")
    )
  }
}
