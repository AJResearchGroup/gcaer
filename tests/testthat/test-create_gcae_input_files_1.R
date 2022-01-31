test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  gcae_input_filenames <- create_gcae_input_files_1()
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)

  # There is only 1 phenotype
  expect_equal(3, ncol(gcae_input_data$phe_table))
  check_gcae_input_data(gcae_input_data)

  # Assume if something is in one table, it is also in the other,
  # thanks to 'check_gcae_input_data'
  n_snps <- 1
  n_individuals <- 1000

  expect_equal(n_snps, nrow(gcae_input_data$bed_table))
  expect_equal(n_individuals, ncol(gcae_input_data$bed_table))

  expect_true(all(gcae_input_data$labels_table$super_population == "Global"))
  expect_true(all(gcae_input_data$labels_table$population %in% LETTERS[1:3]))

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("match inst/extdata/setting_1", {
  testthat::expect_true(plinkr::is_plink_installed())

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
