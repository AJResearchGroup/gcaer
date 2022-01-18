test_that("use", {
  expect_silent(create_test_gcae_setup())
  expect_silent(check_gcae_setup(create_test_gcae_setup()))
})
