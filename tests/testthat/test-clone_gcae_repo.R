test_that("can clone the GCAE repo", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(clone_gcae_repo(gcae_options))
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
