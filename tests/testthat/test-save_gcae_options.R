test_that("use", {
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

test_that("save to sub-sub-sub folder", {
  gcae_options <- create_gcae_options()
  gcae_options_filename <- file.path(
    get_gcaer_tempfilename(), "sub", "sub", "file.csv"
  )
  save_gcae_options(
    gcae_options = gcae_options,
    gcae_options_filename = gcae_options_filename
  )
  expect_true(file.exists(gcae_options_filename))
  file.remove(gcae_options_filename)
})
