test_that("use", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  expect_message(
    summarise_gcae_input_files(
      gcae_input_filenames,
      verbose = TRUE
    )
  )
})

test_that("use, no pop_file", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  gcae_input_filenames$labels_filename <- ""
  check_gcae_input_filenames(gcae_input_filenames)
  expect_silent(
    summarise_gcae_input_files(
      gcae_input_filenames
    )
  )
})

test_that("use, absent pop_file", {
  gcae_input_filenames <- create_test_gcae_input_filenames()
  gcae_input_filenames$labels_filename <- "does_not_exists.csv"
  check_gcae_input_filenames(gcae_input_filenames)
  expect_error(
    summarise_gcae_input_files(
      gcae_input_filenames
    ),
    "does_not_exists.csv"
  )
})
