#' Uninstall GCAE
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_gcae <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  if (!gcaer::is_gcae_installed(gcae_options)) {
    stop(
      "Cannot uninstall a GCAE version that is absent. \n",
      "GCAE version: ", gcae_options$gcae_version, " \n",
      "GCAE folder: ", gcae_options$gcae_folder, " \n",
      "OS: ", gcae_options$os, " \n",
      "Tip 1: maybe you did not expect 'uninstall_gcae' to give an error ",
      "and everything is fine :-)",
      "Tip 2: Use 'gcaer::uninstall_gcae' to uninstall ",
      "a seperate GCAE version"
    )
  }
  unpacked_folder_name <- dirname(gcae_options$gcae_exe_path)
  unlink(unpacked_folder_name, recursive = TRUE)
  testthat::expect_false(
    gcaer::is_gcae_installed(gcae_options)
  )
}
