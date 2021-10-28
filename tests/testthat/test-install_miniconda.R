test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  miniconda_path <- get_miniconda_path(gcae_options)
  install_miniconda(miniconda_path = miniconda_path)
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
