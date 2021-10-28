test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_equal(
    file.path(get_miniconda_path(gcae_options), "bin", "conda"),
    get_conda_binary_path(gcae_options)
  )
})
