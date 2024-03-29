test_that("use", {
  expect_silent(check_analyse_epochs(analyse_epochs = 42))
  expect_silent(check_analyse_epochs(analyse_epochs = c(1, 2)))
  expect_silent(check_analyse_epochs(1))
  expect_error(check_analyse_epochs(0))
  expect_error(check_analyse_epochs(c(2, 1)))
  expect_error(check_analyse_epochs(-1))
  expect_error(check_analyse_epochs("nonsense"))
  expect_error(check_analyse_epochs(""))
  expect_error(check_analyse_epochs(c()))
  expect_error(check_analyse_epochs(NA))
  expect_error(check_analyse_epochs(NULL))
  expect_error(check_analyse_epochs(Inf))
  expect_error(check_analyse_epochs(3.14))
})
