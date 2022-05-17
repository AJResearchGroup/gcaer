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

  # First word is special
  first_word_regex <- "^(--help|train|project|plot|animate|evaluate|-h)$"
  if (!stringr::str_detect(args[1], first_word_regex)) {
    stop(
      "First CLI argument must match regex '", first_word_regex, "' \n",
      "args[1]: ", args[1]
    )
  }
  # Cannot have empty strings
  testthat::expect_equal(0, sum(args == ""))

  # Only detect incorrect dash arguments
  dash_arg_regex <- paste0(
    "^(",
    "-h|",
    "--data|",
    "--datadir|",
    "--data_opts_id|",
    "--epochs|",
    "--epoch|",
    "--help|",
    "--metrics|",
    "--model_id|",
    "--pdata|",
    "--pheno_model_id|",
    "--resume_from|",
    "--superpops|",
    "--save_interval|",
    "--trainedmodelname|",
    "--trainedmodeldir|",
    "--train_opts_id|",
    ")(.*=.*)?$"
  )
  dash_args <- args[substring(args, 1, 1) == "-"]

  invalid_dash_args <- stringr::str_which(
    dash_args,
    dash_arg_regex,
    negate = TRUE
  )
  if (length(invalid_dash_args) != 0) {
    stop(
      "Invalid argument(s): ",
      paste0(invalid_dash_args, collate = ",")
    )
  }
}
