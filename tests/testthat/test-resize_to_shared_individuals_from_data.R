test_that("use, resize fam table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the fam table
  n_individuals <- 3
  gcae_input_data$fam_table <- gcae_input_data$fam_table[
    seq(1, n_individuals),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_labels_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("use, resize labels_table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the labels_table
  n_individuals <- 3
  gcae_input_data$labels_table <- gcae_input_data$labels_table[
    seq(1, n_individuals),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_labels_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("use, resize phe_table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the fam table
  n_individuals <- 3
  gcae_input_data$phe_table <- gcae_input_data$phe_table[
    seq(1, n_individuals),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_labels_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("use, resize all tables", {
  set.seed(42)
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  all_individuals <- nrow(gcae_input_data$phe_table)

  # Keep only half of each table
  get_random_indices <- function(t) {
    sample(
      x = seq(1, nrow(t)),
      size = nrow(t) / 2,
      replace = FALSE
    )
  }
  gcae_input_data$fam_table <- gcae_input_data$fam_table[
    get_random_indices(gcae_input_data$fam_table),
  ]
  gcae_input_data$labels_table <- gcae_input_data$labels_table[
    get_random_indices(gcae_input_data$labels_table),
  ]
  gcae_input_data$phe_table <- gcae_input_data$phe_table[
    get_random_indices(gcae_input_data$phe_table),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  # We took random individuals from 3 tables, hence (0.5^3 = ) 1/8th will
  # be shared individuals
  n_individuals <- after$n_individuals_in_bed_table
  expect_equal(all_individuals / 8, n_individuals, tolerance = 10)
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_labels_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
})

test_that("fails if there is are common IDs with the labels", {
  gcae_input_data <- create_test_gcae_input_data()
  gcae_input_data$labels_table$population <- tempfile() # Unique labels :-)
  expect_error(
    resize_to_shared_individuals_from_data(gcae_input_data),
    "Empty common IDs set"
  )
})