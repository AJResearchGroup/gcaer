test_that("use", {
  nmse_in_time_table <- create_test_nmse_in_time_table()
  expect_silent(check_nmse_in_time_table(nmse_in_time_table))
})
