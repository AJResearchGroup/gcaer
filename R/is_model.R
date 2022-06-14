#' Determine if the `model` is indeed a `model`
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `model` is indeed a `model`
#' @examples
#' # TRUE
#' is_model(model = create_test_model())
#'
#' # FALSE
#' is_model(model = "nonsense")
#' is_model(model = "nonsense", verbose = TRUE)
#' @author Richèl J.C. Bilderbeek
#' @export
is_model <- function(
  model,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    gcaer::check_model(model = model)
    result <- TRUE
  }, error = function(e) {
      if (verbose) message(e$message)
    }
  )
  result
}
