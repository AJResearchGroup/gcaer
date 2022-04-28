test_that("minimal use", {
  expect_silent(
    check_gcae_input_data_data_type(
      create_test_gcae_input_data()
    )
  )
})
