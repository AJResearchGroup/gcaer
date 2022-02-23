test_that("use", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))
})
