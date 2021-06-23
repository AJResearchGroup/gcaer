#' Install a specific version of GCAE
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_gcae <- function(
  gcae_options = create_gcae_options()
) {
  gcaer::check_gcae_options(gcae_options)
  testthat::expect_false(
    gcaer::is_gcae_installed(gcae_options)
  )

  gcae_zip_path <- get_gcae_zip_path(gcae_options)
  dir.create(
    path = dirname(gcae_zip_path),
    showWarnings = FALSE,
    recursive = TRUE
  )

  if (!file.exists(gcae_zip_path)) {
    utils::download.file(
      url = gcaer::get_gcae_download_url(
        gcae_version = gcae_options$gcae_version,
        os = gcae_options$os
      ),
      destfile = gcae_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(gcae_zip_path))
  gcae_exe_path <- gcae_options$gcae_exe_path

  gcae_sub_folder <- dirname(gcae_exe_path)
  dir.create(gcae_sub_folder, showWarnings = FALSE, recursive = TRUE)

  if (!file.exists(gcae_exe_path)) {
    utils::unzip(
      gcae_zip_path,
      exdir = gcae_sub_folder
    )
  }
  if (gcae_options$gcae_version == "1.7") {
    # v1.7 extracts into an own subfolder. Move files up.
    from <- list.files(gcae_sub_folder, full.names = TRUE, recursive = TRUE)
    to <- file.path(dirname(dirname(from)), basename(from))
    file.copy(from = from, to = to)
    unlink(dirname(from[1]), recursive = TRUE)
  }

  testthat::expect_true(file.exists(gcae_exe_path))

  testthat::expect_true(
    gcaer::is_gcae_installed(gcae_options)
  )
}
