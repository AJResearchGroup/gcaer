test_that("use, with labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- gcaer::create_test_gcae_input_filenames()
  expect_true("labels_filename" %in% names(gcae_input_filenames))
  expect_true(file.exists(gcae_input_filenames$labels_filename))
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  expect_true("labels_table" %in% names(gcae_input_data))
  check_gcae_input_data(gcae_input_data)
})

test_that("use, without labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- gcaer::create_test_gcae_input_filenames()
  gcae_input_filenames$labels_filename <- NULL
  expect_false("labels_filename" %in% names(gcae_input_filenames))
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  expect_false("labels_table" %in% names(gcae_input_data))
  check_gcae_input_data(gcae_input_data)
})


test_that("use, with labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "read_gcae_input_files"
    )
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  check_gcae_input_data(gcae_input_data)

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("use, without labels", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "read_gcae_input_files"
    )
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  gcae_input_filenames$labels_filename <- NULL
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  check_gcae_input_data(gcae_input_data)
  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("error message if file is absent", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_test_gcae_input_filenames()
  gcae_input_filenames$labels_filename <- "does_not_exists.csv"
  check_gcae_input_filenames(gcae_input_filenames)
  expect_error(
    read_gcae_input_files(
      gcae_input_filenames
    ),
    "does_not_exists.csv"
  )
})
