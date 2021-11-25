test_that("use", {
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(get_run_gcae_py_path(gcae_options))

})
