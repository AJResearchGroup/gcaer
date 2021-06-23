#' Check if the GCAE version is valid, will stop if not
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_gcae_version("1.0")
#' @export
check_gcae_version <- function(gcae_version) {
  if (length(gcae_version) != 1) {
    stop(
      "'gcae_version' must have one element \n",
      "length(gcae_version): ", length(gcae_version)
    )
  }
  gcae_versions <- c("1.0")
  if (!gcae_version %in% gcae_versions) {
    stop(
      "Invalid 'gcae_version'. \n",
      "Actual value: ", gcae_version, " \n",
      "Valid values: ", paste0(gcae_versions, collapse = " ")
    )
  }
}
