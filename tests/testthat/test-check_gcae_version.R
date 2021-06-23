test_that("use", {
  expect_silent(check_gcae_version("1.0"))
  expect_error(check_gcae_version("nonsense"))
  expect_error(check_gcae_version(NA))
  expect_error(check_gcae_version(NULL))
  expect_error(check_gcae_version(Inf))
  expect_error(check_gcae_version(""))
  expect_error(check_gcae_version(c()))
  expect_error(
    check_gcae_version(c("1.7", "1.9")),
    "must have one element"
  )
  expect_error(check_gcae_version(3.14))
  expect_error(check_gcae_version(42))
})
