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
  testthat::expect_true("gcae_folder" %in% names(gcae_options))
  testthat::expect_true("ormr_folder_name" %in% names(gcae_options))
  testthat::expect_true("gcae_version" %in% names(gcae_options))
  testthat::expect_true("python_version" %in% names(gcae_options))
  c(
    paste0("'gcae_options$gcae_folder': ", gcae_options$gcae_folder),
    paste0("'gcae_options$ormr_folder_name': ", gcae_options$ormr_folder_name),
    paste0("'gcae_options$gcae_folder': ", gcae_options$gcae_folder),
    paste0("'gcae_options$python_version': ", gcae_options$python_version)
  )
}
