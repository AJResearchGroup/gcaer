test_that("use", {
  gcae_options <- create_gcae_options()
  gcae_options_filename <- get_gcaer_tempfilename(fileext = ".csv")
  save_gcae_options(
    gcae_options = gcae_options,
    gcae_options_filename = gcae_options_filename
  )
  gcae_options_again <- read_gcae_options_file(gcae_options_filename)
  expect_identical(gcae_options, gcae_options_again)
  file.remove(gcae_options_filename)
})
