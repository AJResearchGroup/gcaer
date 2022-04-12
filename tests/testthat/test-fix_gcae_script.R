test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(
    clone_gcae_repo(
      gcae_options,
      github_repo_url = "https://github.com/cnettel/GenoCAE",
      github_repo_branch_name = "Pheno"
    )
  )
  fix_gcae_script(gcae_options = gcae_options)
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})

test_that("cannot fix twice", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  gcae_options <- create_gcae_options(gcae_folder = get_gcaer_tempfilename())
  expect_silent(
    clone_gcae_repo(
      gcae_options,
      github_repo_url = "https://github.com/cnettel/GenoCAE",
      github_repo_branch_name = "Pheno"
    )
  )
  fix_gcae_script(gcae_options = gcae_options)
  expect_error(
    fix_gcae_script(gcae_options = gcae_options),
    "GCAE script is already fixed"
  )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
