#' Check if the files to run \link{gcae_train} are present.
#'
#' Check if the files to run \link{gcae_train} are present.
#' Will \link{stop} if not.
#'
#' These files are:
#'  * The PLINK (`.bed`, `.bim`, `.fam`) binary files
#'  * The PLINK (`.phe`) phenotype file
#'  * A labels (`.csv`) file
#'  * A `GCAE` architecture setup file,
#'    for example, `M[x].json`, where `[x]` is a number
#'  * A `GCAE` data options setup file,
#'    for example, `b_[x]_[y].json`, where `[x]` and `[y]` are numbers
#'  * A `GCAE` training options setup file,
#'    for example, `ex[x].json`, where `[x]` is a number
#'
#' The files will not be checked if their content is valid
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_train_files_are_present <- function( # nolint indeed a long function name
  gcae_setup,
  gcae_options
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_gcae_options(gcae_options)
  bed_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".bed")
  bim_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".bim")
  fam_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".fam")
  phe_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".phe")
  if (!file.exists(bed_filename)) {
    stop(".bed file not found at ", bed_filename)
  }
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  if (!file.exists(phe_filename)) {
    stop(".phe file not found at ", phe_filename)
  }
  if (nchar(gcae_setup$superpops) > 0) {
    testthat::expect_true(file.exists(gcae_setup$superpops))
  }

  testthat::expect_true(
    file.exists(
      get_gcae_data_opts_filename(
        data_opts_id = gcae_setup$data_opts_id,
        gcae_options = gcae_options
      )
    )
  )
  testthat::expect_true(
    file.exists(
      get_gcae_model_filename(
        model_id = gcae_setup$model_id,
        gcae_options = gcae_options
      )
    )
  )
  testthat::expect_true(
    file.exists(
      get_gcae_train_opts_filename(
        train_opts_id = gcae_setup$train_opts_id,
        gcae_options = gcae_options
      )
    )
  )

}
