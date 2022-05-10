test_that("use", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_message(
    summarise_gcae_input_data(
      gcae_input_data = gcae_input_data,
      verbose = TRUE
    )
  )
})

test_that("use, no labels", {
  gcae_input_data <- create_test_gcae_input_data()
  gcae_input_data$labels_table <- NULL
  expect_silent(
    summarise_gcae_input_data(
      gcae_input_data
    )
  )
})
