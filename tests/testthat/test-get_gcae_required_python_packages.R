test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()

  expect_silent(
    get_gcae_required_python_packages()
  )

  # This is not in the list, but it is needed
  expect_true(
    "utils" %in% get_gcae_required_python_packages()
  )
})

test_that("need to clone the repo", {
  gcae_options <- create_gcae_options(gcae_folder = tempfile())
  expect_error(
    get_gcae_required_python_packages(gcae_options = gcae_options),
    "Tip: run 'gcaer::clone_gcae_repo"
  )
})
