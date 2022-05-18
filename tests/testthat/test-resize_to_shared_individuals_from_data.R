test_that("minimal", {
  gcae_input_data <- create_test_gcae_input_data()
  resize_to_shared_individuals_from_data(gcae_input_data)
  suppressMessages(
    expect_message(
      resize_to_shared_individuals_from_data(gcae_input_data, verbose = TRUE)
    )
  )
})

test_that("no labels_table", {
  gcae_input_data <- create_test_gcae_input_data()
  gcae_input_data$labels_table <- NULL
  resized_gcae_input_data <- resize_to_shared_individuals_from_data(
    gcae_input_data
  )
  expect_equal(names(gcae_input_data), names(resized_gcae_input_data))
})

test_that("test dataset, test output", {
  gcae_input_data <- resize_to_shared_individuals_from_data(
    create_test_gcae_input_data()
  )
  expect_false("index" %in% names(gcae_input_data$phe_table))
  utils::head(gcae_input_data$labels_table)
})


test_that("use, resize fam table", {
  if (!plinkr::is_plink_installed()) return()
  all_gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(all_gcae_input_data))

  # Keep only the first half of the fam table
  gcae_input_data <- plinkr::select_samples(
    data = all_gcae_input_data,
    sample_selector = plinkr::create_random_samples_selector(
      n_samples = 10
    )
  )
  gcae_input_data$labels_table <- all_gcae_input_data$labels_table
  gcae_input_data$phe_table <- all_gcae_input_data$phe_table
  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("use, resize labels_table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  before <- summarise_gcae_input_data(gcae_input_data)

  # Remove the first population from thelabels_table
  population_to_remove <- gcae_input_data$labels_table$population[1]
  gcae_input_data$labels_table <- gcae_input_data$labels_table[
    gcae_input_data$labels_table$population != population_to_remove,
  ]

  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_equal(
    before$n_populations_in_labels_table,
    after$n_populations_in_labels_table + 1
  )
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("use, resize phe_table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the phe table
  n_individuals <- 3
  gcae_input_data$phe_table <- gcae_input_data$phe_table[
    seq(1, n_individuals),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
  expect_true(any(as.integer(after) != as.integer(before)))
})

test_that("cannot when NA's are in phe_table", {
  gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(gcae_input_data))

  # Keep only the first half of the phe table
  expect_true("phe_table" %in% names(gcae_input_data))
  expect_true("additive" %in% names(gcae_input_data$phe_table))
  n_individuals <- 3
  gcae_input_data$phe_table$additive[
    seq(from = n_individuals + 1, to = nrow(gcae_input_data$phe_table))
  ] <- NA
  expect_error(
    summarise_gcae_input_data(gcae_input_data),
    "'gcae_input_data.phe_table' must not contain NAs"
  )
  expect_error(
    resize_to_shared_individuals_from_data(gcae_input_data),
    "'gcae_input_data.phe_table' must not contain NAs"
  )
})

test_that("use, resize all tables", {
  if (!plinkr::is_plink_installed()) return()

  set.seed(314)
  all_gcae_input_data <- create_test_gcae_input_data()
  expect_silent(check_gcae_input_data(all_gcae_input_data))
  all_individuals <- nrow(all_gcae_input_data$phe_table)

  # .bed, .bim, .fam
  gcae_input_data <- plinkr::select_samples(
    data = all_gcae_input_data,
    sample_selector = plinkr::create_random_samples_selector(
      n_samples = all_individuals / 10
    )
  )
  gcae_input_data$phe_table <- all_gcae_input_data$phe_table
  gcae_input_data$labels_table <- all_gcae_input_data$labels_table
  # Gets 50% of all indices, randomly chosen
  get_random_indices <- function(t) {
    sort(
      sample(
        x = seq(1, nrow(t)),
        size = nrow(t) / 2,
        replace = FALSE
      )
    )
  }
  gcae_input_data$phe_table <- all_gcae_input_data$phe_table[
    get_random_indices(gcae_input_data$phe_table),
  ]

  before <- summarise_gcae_input_data(gcae_input_data)
  gcae_input_data <- resize_to_shared_individuals_from_data(gcae_input_data)
  after <- summarise_gcae_input_data(gcae_input_data)
  # We took 10% of the PLINK data and 50% of the .phe data
  n_individuals <- after$n_individuals_in_bed_table
  expect_equal(
    all_individuals * 0.1 * 0.5,
    n_individuals,
    tolerance = 5
  )
  expect_equal(n_individuals, after$n_individuals_in_bed_table)
  expect_equal(n_individuals, after$n_individuals_in_fam_table)
  expect_equal(n_individuals, after$n_individuals_in_phe_table)
})

test_that("fails if there is are common IDs with the labels", {
  gcae_input_data <- create_test_gcae_input_data()
  gcae_input_data$labels_table$population <-
    paste0(gcae_input_data$labels_table$population, "X")
  check_labels_table(gcae_input_data$labels_table)

  expect_error(
    resize_to_shared_individuals_from_data(gcae_input_data),
    "Empty common IDs set"
  )
})
