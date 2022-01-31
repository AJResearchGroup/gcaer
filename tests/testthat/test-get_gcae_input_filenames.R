test_that("use", {
  gcae_setup <- create_test_gcae_setup()
  gcae_options <- create_gcae_options()
  gcae_input_filenames <- get_gcae_input_filenames(
    gcae_setup = gcae_setup
  )
  read_gcae_input_files(gcae_input_filenames)
})
