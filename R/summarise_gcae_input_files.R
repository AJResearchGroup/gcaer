#' Summarise the GCAE input files
#'
#' Summarise the GCAE input files
#' @inheritParams default_params_doc
#' @return This function will show the summary using \link{message}.
#' A \link{list} with all the elements shown is returned as well
#' @note this function is named after the base R \link{summarise} function
#' @examples
#' gcae_input_filenames <- create_test_gcae_input_filenames()
#' summarise_gcae_input_files(gcae_input_filenames)
#' @author Richèl J.C. Bilderbeek
#' @export
summarise_gcae_input_files <- function(gcae_input_filenames) {
  gcaer::check_gcae_input_filenames(gcae_input_filenames = gcae_input_filenames)
  gcae_input_data <- gcaer::read_gcae_input_files(
    gcae_input_filenames = gcae_input_filenames
  )
  gcaer::summarise_gcae_input_data(
    gcae_input_data = gcae_input_data
  )
}
