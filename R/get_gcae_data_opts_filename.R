#' Get the filename to the GCAE data options
#'
#' Get the filename to the GCAE data options.
#' This function is named after the GCAE `data_opts` folder.
#' @inheritParams default_params_doc
#' @return full path to the data options' JSON file
#' @examples
#' get_gcae_data_opts_filename(
#'   data_opts_id = "b_0_4"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
get_gcae_data_opts_filename <- function(
  data_opts_id = "b_0_4",
  gcae_options = create_gcae_options()
) {
  file.path(
    gcae_options$gcae_folder,
    "data_opts",
    paste0(data_opts_id, ".json")
  )
}
