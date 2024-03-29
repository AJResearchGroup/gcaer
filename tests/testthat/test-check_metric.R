test_that("use", {
  expect_silent(check_metric(""))
  expect_silent(check_metric("hull_error"))
  expect_silent(check_metric("f1_score_3"))
  expect_silent(check_metric("f1_score_123"))
  expect_error(check_metric("hull_error,f1_score_3"))
  expect_error(check_metric("f1_score_3,hull_error"))
  expect_error(check_metric(c("f1_score_3", "f1_score_3")))
  expect_error(check_metric(0))
  expect_error(check_metric(-1))
  expect_error(check_metric("nonsense"))
  expect_error(check_metric(c()))
  expect_error(check_metric(NA))
  expect_error(check_metric(NULL))
  expect_error(check_metric(Inf))
  expect_error(check_metric(3.14))
})
