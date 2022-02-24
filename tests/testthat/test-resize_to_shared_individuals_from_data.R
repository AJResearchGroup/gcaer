test_that("use", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the phenotypes
  gcae_input_data$phe_table <- gcae_input_data$phe_table[
    seq(1, nrow(gcae_input_data$phe_table) / 2),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("fails if there is are common IDs with the labels", {
  gcae_input_data <- create_test_gcae_input_data()
  gcae_input_data$labels_table$population <- tempfile() # Unique labels :-)
  expect_error(
    resize_to_shared_individuals_from_data(gcae_input_data),
    "Empty common IDs set"
  )
})
