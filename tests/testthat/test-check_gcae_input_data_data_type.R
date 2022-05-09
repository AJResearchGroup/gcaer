test_that("minimal use", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(
    check_gcae_input_data_data_type(
      gcae_input_data
    )
  )
  gcae_input_data$labels_table <- NULL
  expect_silent(
    check_gcae_input_data_data_type(
      gcae_input_data
    )
  )

})
