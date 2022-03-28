test_that("use", {
  skip("WIP #19")
  gcae_options <- create_gcae_options()
  check_gcae_options(gcae_options)
  gcae_options_filename <- get_gcaer_tempfilename(fileext = ".csv")
  save_gcae_options(
    gcae_options = gcae_options,
    gcae_options_filename = gcae_options_filename
  )
  expect_true(file.exists(gcae_options_filename))
  file.remove(gcae_options_filename)
})
