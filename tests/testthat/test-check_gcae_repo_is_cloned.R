test_that("use", {
  expect_error(
    check_gcae_repo_is_cloned(
      gcae_options = create_gcae_options(gcae_folder = tempfile())
    ),
    "GCAE repository is not cloned"
  )

  if (has_cloned_gcae_repo()) {
    expect_silent(check_gcae_repo_is_cloned())
  } else {
    expect_error(check_gcae_repo_is_cloned())
  }
})
