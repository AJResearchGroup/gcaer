#' Read a `gcae_setup` from file
#' @inheritParams default_params_doc
#' @return the `gcae_setup`
#' as can be checked by \link{check_gcae_setup}
#' @seealso use \link{save_gcae_setup} to save a `gcae_setup`
#' @examples
#' # Create a gcae_setup
#' gcae_setup <- create_test_gcae_setup()
#'
#' # Use a temporary file
#' gcae_setup_filename <- get_gcaer_tempfilename(fileext = ".csv")
#'
#' # Save gcae_setup to temporary file
#' save_gcae_setup(
#'   gcae_setup = gcae_setup,
#'   gcae_setup_filename = gcae_setup_filename
#' )
#'
#' # Load the temporary file to get a copy of the gcae_setup
#' gcae_setup_again <- read_gcae_setup_file(gcae_setup_filename)
#'
#' # Cleanup
#' file.remove(gcae_setup_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
read_gcae_setup_file <- function(gcae_setup_filename) {
  testthat::expect_true(file.exists(gcae_setup_filename))
  gcaer::check_gcae_setup_filename(gcae_setup_filename)
  t <- readr::read_csv(
    file = gcae_setup_filename,
    col_types = readr::cols(
      parameter = readr::col_character(),
      value = readr::col_character()
    )
  )
  testthat::expect_true("datadir" %in% t$parameter)
  datadir <- t$value[which("datadir" == t$parameter)]

  testthat::expect_true("data" %in% t$parameter)
  data <- t$value[which("data" == t$parameter)]

  testthat::expect_true("superpops" %in% t$parameter)
  superpops <- t$value[which("superpops" == t$parameter)]
  if (is.na(superpops)) superpops <- ""

  testthat::expect_true("model_id" %in% t$parameter)
  model_id <- t$value[which("model_id" == t$parameter)]

  testthat::expect_true("train_opts_id" %in% t$parameter)
  train_opts_id <- t$value[which("train_opts_id" == t$parameter)]

  testthat::expect_true("data_opts_id" %in% t$parameter)
  data_opts_id <- t$value[which("data_opts_id" == t$parameter)]

  testthat::expect_true("trainedmodeldir" %in% t$parameter)
  trainedmodeldir <- t$value[which("trainedmodeldir" == t$parameter)]

  testthat::expect_true("pheno_model_id" %in% t$parameter)
  pheno_model_id <- t$value[which("pheno_model_id" == t$parameter)]

  gcaer::create_gcae_setup(
    datadir = datadir,
    data = data,
    superpops = superpops,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    pheno_model_id = pheno_model_id,
    trainedmodeldir = trainedmodeldir
  )
}
