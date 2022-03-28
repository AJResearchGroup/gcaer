test_that("use", {
  gcae_setup <- create_test_gcae_setup()
  gcae_setup_filename <- get_gcaer_tempfilename(fileext = ".csv")
  save_gcae_setup(
    gcae_setup = gcae_setup,
    gcae_setup_filename = gcae_setup_filename
  )
  gcae_setup_again <- read_gcae_setup_file(gcae_setup_filename)
  expect_identical(gcae_setup, gcae_setup_again)
  file.remove(gcae_setup_filename)
})
