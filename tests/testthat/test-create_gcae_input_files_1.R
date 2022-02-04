test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  n_individuals <- 5
  n_traits <- 3
  n_snps_per_trait <- 2
  gcae_input_filenames <- create_gcae_input_files_1(
    n_individuals = n_individuals,
    n_traits = n_traits,
    n_snps_per_trait = n_snps_per_trait
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)

  expect_silent(check_gcae_input_data(gcae_input_data))

  # There is only 1 phenotype
  expect_equal(2 + n_traits, ncol(gcae_input_data$phe_table))

  # Assume if something is in one table, it is also in the other,
  # thanks to 'check_gcae_input_data'
  n_snps <- n_traits * n_snps_per_trait

  expect_equal(n_snps, nrow(gcae_input_data$bed_table))
  expect_equal(n_individuals, ncol(gcae_input_data$bed_table))

  expect_true(
    all(
      gcae_input_data$labels_table$super_population %in%
        c("Americas", "Central/South Asia")
    )
  )
  expect_true(all(gcae_input_data$labels_table$population %in% LETTERS[1:3]))

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("match inst/extdata/setting_1", {
  skip("Does not need to match anymore")
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  # The original data
  expected_gcae_input_data <- NA
  { # nolint do use this syntax to indicate a scope
    gcae_input_filenames <- create_gcae_input_filenames(
      bed_filename = get_gcaer_filename("gcae_input_files_1.bed"),
      bim_filename = get_gcaer_filename("gcae_input_files_1.bim"),
      fam_filename = get_gcaer_filename("gcae_input_files_1.fam"),
      phe_filename = get_gcaer_filename("gcae_input_files_1.phe"),
      labels_filename = get_gcaer_filename("gcae_input_files_1_labels.csv")
    )
    gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
    expected_gcae_input_data <- gcae_input_data
  }
  # Re-created data
  created_gcae_input_data <- NA
  { # nolint do use this syntax to indicate a scope
    filenames <- create_gcae_input_files_1(tempfile())
    created_gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
    file.remove(as.character(unlist(filenames)))
  }
  expect_equal(created_gcae_input_data, expected_gcae_input_data)
})

test_that("use", {
  if (1 == 2) {
    # Re-create the files in inst/extdata
    create_gcae_input_files_1(
      base_input_filename = "~/GitHubs/gcaer/inst/extdata/gcae_input_files_1"
    )
  }
})
