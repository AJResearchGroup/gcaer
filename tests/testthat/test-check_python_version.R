test_that("use", {
  expect_silent(check_python_version("3.6"))
  expect_error(check_python_version(c("3.6", "3.6")))
  expect_error(check_python_version(0))
  expect_error(check_python_version(-1))
  expect_error(check_python_version(""))
  expect_error(check_python_version(c()))
  expect_error(check_python_version(NA))
  expect_error(check_python_version(NULL))
  expect_error(check_python_version(Inf))
  expect_error(check_python_version(42))
  expect_error(check_python_version(3.14))
})
