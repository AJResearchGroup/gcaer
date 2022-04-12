test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  gcae_options <- create_gcae_options(ormr_folder_name = "python3")
  if (!is_gcae_installed(gcae_options)) return()

  text <- run_gcae(
    args = "--help",
    gcae_options = gcae_options
  )
  expect_true(
    any(
      stringr::str_detect(
        string = text,
        pattern = "GenoCAE"
      )
    )
  )
})

test_that("error", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  args <- c("--nonsense")
  expect_error(
    run_gcae(args),
    "First CLI argument must match regex"
  )
})
