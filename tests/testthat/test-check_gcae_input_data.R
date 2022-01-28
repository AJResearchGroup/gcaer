test_that("minimal use", {
  gcae_input_filenames <- create_gcae_input_files_1()
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  expect_silent(check_gcae_input_data(gcae_input_data))

  expect_error(check_gcae_input_data(gcae_input_data = "nonsense"))
  expect_error(check_gcae_input_data(gcae_input_data = list(x = "nonsense")))
})

test_that("abuse", {
  gcae_input_filenames <- create_gcae_input_files_1()
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)
  expect_silent(check_gcae_input_data(gcae_input_data))

  ###############
  # bed_table
  ###############
  # Remove a row from the bed table
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$bed_table <- bad_gcae_input_data$bed_table[-1, ]
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "Must have an equal amount of SNPs in .bed and .bim table"
  )
  # Add a col to the bed table (cannot delete the 1 column)
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$bed_table <- cbind(
    bad_gcae_input_data$bed_table,
    bad_gcae_input_data$bed_table
  )
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "Must have an equal amount of individuals in .bed and .fam table"
  )

  ###############
  # bim_table
  ###############
  # Add a SNP
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$bim_table <- rbind(
    bad_gcae_input_data$bim_table,
    bad_gcae_input_data$bim_table
  )
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "Must have an equal amount of SNPs in .bed and .bim table"
  )
  # Rename the SNP
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$bim_table$id <- "snp_nonsense"
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "SNP names in .bed and .bim table must match"
  )
  ###############
  # fam_table
  ###############
  # Remove an individual
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$fam_table <- bad_gcae_input_data$fam_table[-1, ]
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "Must have an equal amount of individuals in .bed and .fam table"
  )
  ###############
  # labels_table
  ###############
  ###############
  # phe_table
  ###############
  skip("WIP")
  # Set all FIDs to the same value
  bad_gcae_input_data <- gcae_input_data
  bad_gcae_input_data$phe_table$FID <- "A"
  expect_error(
    check_gcae_input_data(bad_gcae_input_data),
    "All individuals in the .phe table must be unique"
  )

})
