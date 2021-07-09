test_that("use", {
  expect_error(get_gcaer_filename("abs.ent"))
  expect_silent(get_gcaer_filename("train_times.csv"))
})
