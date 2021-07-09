test_that("use", {
  expect_silent(check_gcae_options(create_gcae_options()))
  expect_error(check_gcae_options("nonsense"))
  expect_error(check_gcae_options(""))
  expect_error(check_gcae_options(c()))
  expect_error(check_gcae_options(NA))
  expect_error(check_gcae_options(NULL))
  expect_error(check_gcae_options(Inf))
  expect_error(check_gcae_options(42))
  expect_error(check_gcae_options(3.14))
  expect_error(
    check_gcae_options(
      c(create_gcae_options(), create_gcae_options())
    )
  )
})
