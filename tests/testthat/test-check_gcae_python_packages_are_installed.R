test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  gcae_options <- create_gcae_options()
  skip("Packages are already installed")
  expect_error(
    check_gcae_python_packages_are_installed(
      gcae_options = gcae_options
    ),
    "GCAE repo is not cloned"
  )
  clone_gcae_repo(gcae_options = gcae_options)
  if (1 == 2) {
    # 'ormr' is eager
    expect_error(
      check_gcae_python_packages_are_installed(
        gcae_options = gcae_options
      ),
      "Conda environment does not exist"
    )
    ormr::create_conda_env(
      ormr_folder_name = gcae_options$ormr_folder_name
    )
  }
  expect_error(
    check_gcae_python_packages_are_installed(
      gcae_options = gcae_options
    ),
    "Python package 'docopt' not installed"
  )
  gcaer::install_gcae_requirements(gcae_options = gcae_options)
  expect_silent(
    check_gcae_python_packages_are_installed(
      gcae_options = gcae_options
    )
  )
})
