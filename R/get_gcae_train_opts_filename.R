#' Get the filename to the GCAE training options
#'
#' Get the filename to the GCAE training options.
#' This function is named after the GCAE `train_opts` folder.
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_train_opts_filename <- function(
  train_opts_id = "ex3",
  gcae_options = create_gcae_options()
) {
  file.path(
    gcae_options$gcae_folder,
    "train_opts",
    paste0(train_opts_id, ".json")
  )
}
