test_that("use", {
  expect_error(
    check_gcae_repo_is_cloned(
      gcae_options = create_gcae_options(gcae_folder = tempfile())
    ),
    "GCAE repository is not cloned"
  )
})

test_that("abuse: no file", {
  expect_error(
    check_gcae_repo_is_cloned(
      gcae_options = create_gcae_options(gcae_folder = tempfile())
    ),
    "GCAE repository is not cloned"
  )
})

test_that("abuse: no file", {
  gcae_options <- create_gcae_options(gcae_folder = tempfile())
  clone_gcae_repo(gcae_options = gcae_options)
  expect_silent(check_gcae_repo_is_cloned(gcae_options = gcae_options))

  filename <- file.path(gcae_options$gcae_folder, "requirements.txt")
  file.remove(filename)

  expect_error(
    check_gcae_repo_is_cloned(
      gcae_options = gcae_options
    ),
    "GCAE repository is not cloned: file not found"
  )
  unlink(gcae_options$gcae_folder, recursive = TRUE)
})
