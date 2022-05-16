test_that("use", {
  gcae_experiment_params <- create_test_gcae_experiment_params()
  gcae_experiment_params_filename <- get_gcaer_tempfilename(fileext = ".csv") # nolint indeed a long variable name
  save_gcae_experiment_params(
    gcae_experiment_params = gcae_experiment_params,
    gcae_experiment_params_filename = gcae_experiment_params_filename
  )
  gcae_experiment_params_again <- read_gcae_experiment_params_file(
    gcae_experiment_params_filename
  )
  expect_identical(gcae_experiment_params, gcae_experiment_params_again)
  file.remove(gcae_experiment_params_filename)
})

test_that("use, no superpops", {
  gcae_experiment_params <- create_test_gcae_experiment_params(
    gcae_setup = create_test_gcae_setup(
      superpops = ""
    ),
    metrics = ""
  )
  gcae_experiment_params_filename <- get_gcaer_tempfilename(fileext = ".csv") # nolint indeed a long variable name
  save_gcae_experiment_params(
    gcae_experiment_params = gcae_experiment_params,
    gcae_experiment_params_filename = gcae_experiment_params_filename
  )
  gcae_experiment_params_again <- read_gcae_experiment_params_file(
    gcae_experiment_params_filename
  )
  expect_identical(gcae_experiment_params, gcae_experiment_params_again)
  file.remove(gcae_experiment_params_filename)
})

test_that("use, add extra info, #43", {
  gcae_experiment_params <- create_test_gcae_experiment_params()
  gcae_experiment_params_filename <- get_gcaer_tempfilename(fileext = ".csv") # nolint indeed a long variable name
  window_kb <- "1000" # The extra parameter, will be read as string
  gcae_experiment_params$window_kb <- window_kb
  save_gcae_experiment_params(
    gcae_experiment_params = gcae_experiment_params,
    gcae_experiment_params_filename = gcae_experiment_params_filename
  )

  # It is saved
  expect_equal(
    1,
    length(
      stringr::str_subset(
        readr::read_lines(gcae_experiment_params_filename),
        "window_kb"
      )
    )
  )

  # It is read
  gcae_experiment_params_again <- read_gcae_experiment_params_file(
    gcae_experiment_params_filename
  )
  check_gcae_experiment_params(gcae_experiment_params)
  expect_true("window_kb" %in% names(gcae_experiment_params_again))
  expect_equal(window_kb, gcae_experiment_params_again$window_kb)
  expect_identical(gcae_experiment_params, gcae_experiment_params_again)
  file.remove(gcae_experiment_params_filename)
})
