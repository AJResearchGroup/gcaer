test_that("use", {
  expect_silent(check_gcae_args(args = "--help"))
  expect_error(check_gcae_args(args = "--nonsense"))
})
