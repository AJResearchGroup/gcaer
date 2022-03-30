test_that("use", {
  gcae_setup <- create_test_gcae_setup()
  check_gcae_setup(gcae_setup)
  gcae_setup_filename <- get_gcaer_tempfilename(fileext = ".csv")
  save_gcae_setup(
    gcae_setup = gcae_setup,
    gcae_setup_filename = gcae_setup_filename
  )
  expect_true(file.exists(gcae_setup_filename))
  file.remove(gcae_setup_filename)
})

test_that("sub-sub-sub folder", {
  gcae_setup <- create_test_gcae_setup()
  gcae_setup_filename <- file.path(
    get_gcaer_tempfilename(),
    "sub", "sub", "file.csv"
  )
  save_gcae_setup(
    gcae_setup = gcae_setup,
    gcae_setup_filename = gcae_setup_filename
  )
  expect_true(file.exists(gcae_setup_filename))
  file.remove(gcae_setup_filename)
})
