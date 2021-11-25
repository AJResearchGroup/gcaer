test_that("show help", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_gcae_installed()) return()
  ormr_folder_name <- create_gcae_options()$gcae_folder
  t <- ormr::get_installed_python_packages(ormr_folder_name = ormr_folder_name)
  # ormr::install_python_package_with_version(
  #   ormr_folder_name = ormr_folder_name,
  #   package_name = "python",
  #   package_version = "3.6.0"
  # )
  ormr::install_python_package_with_version(
    ormr_folder_name = ormr_folder_name,
    package_name = "numpy",
    package_version = "1.19.2"
  )
  ormr::install_python_package_with_version(
    ormr_folder_name = ormr_folder_name,
    package_name = "six",
    package_version = "1.15.0"
  )
  ormr::install_python_package_with_version(
    ormr_folder_name = ormr_folder_name,
    package_name = "tensorflow",
    package_version = "2.2.0",
    verbose = TRUE
  )

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
