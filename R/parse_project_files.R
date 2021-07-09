#' Parse the data from the files produced by \link{gcae_project}
#'
#' Parse the data from the files produced by \link{gcae_project}
#' @inheritParams default_params_doc
#' @return a list of tibbles
#'  * `x`: x
#' @author Richèl J.C. Bilderbeek
#' @export
parse_project_files <- function(project_filenames) {
  losses_from_project_filename <- stringr::str_subset(
    project_filenames, "losses_from_project\\.csv$"
  )
  genotype_concordances_filename <- stringr::str_subset(
    project_filenames, "genotype_concordances\\.csv$"
  )
  losses_from_project_table <- gcaer::parse_losses_from_project_file(
    losses_from_project_filename
  )
  genotype_concordances_table <- gcaer::parse_genotype_concordances_file(
    genotype_concordances_filename
  )
  list(
    losses_from_project_table = losses_from_project_table,
    genotype_concordances_table = genotype_concordances_table
  )
}
