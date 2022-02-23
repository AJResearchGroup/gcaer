test_that("use", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_message(summarise_gcae_input_data(gcae_input_data))
})
