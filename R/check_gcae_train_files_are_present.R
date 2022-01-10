#' Check if the files to run \link{gcae_train} are present.
#'
#' Check if the files to run \link{gcae_train} are present.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @export
check_gcae_train_files_are_present <- function(gcae_setup) {
  gcaer::check_gcae_setup(gcae_setup)
  # (base) richel@N141CU:~/.local/share/gcaer/gcae_v1_0/example_tiny$ ls issue_2_bin.*
  #   issue_2_bin.bed  issue_2_bin.bim  issue_2_bin.fam  issue_2_bin.phe
  bed_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".bed")
  bim_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".bim")
  fam_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".fam")
  phe_filename <- paste0(file.path(gcae_setup$datadir, gcae_setup$data), ".phe")
  if (!file.exists(bed_filename)) {
    stop(".bed file not found at ", bed_filename)
  }
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  testthat::expect_true(file.exists(phe_filename))
}
