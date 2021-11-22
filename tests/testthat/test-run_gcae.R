test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  ormr_folder_name <- create_gcae_options()$gcae_folder
  t <- ormr::get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  # ormr::install_python_packages(ormr_folder_name = ormr_folder_name, package_names = "utils")
  # ormr::install_python_packages(
  #   ormr_folder_name = ormr_folder_name,
  #   package_names = "setuptools==47.1.1",
  #   verbose = TRUE
  # )
  # testthat::expect_true(
  #   ormr::is_python_package_installed(
  #     ormr_folder_name = ormr_folder_name,
  #     package_name = "setuptools==47.1.1",
  #     verbose = TRUE
  #   )
  # )
  # ormr::get_installed_python_packages()
  # ormr::
  # ormr::get_installed_python_packages(ormr_folder_name = create_gcae_options()$gcae_folder)
  expect_silent(
    run_gcae(
      args = "--help"
    )
  )
})

test_that("error", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  args <- c("--nonsense")
  expect_error(run_gcae(args), "Invalid command")
})
