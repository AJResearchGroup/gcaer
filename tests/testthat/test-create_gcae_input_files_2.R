test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  n_individuals <- 1000
  n_random_snps <- 1000

  gcae_input_filenames <- create_gcae_input_files_2(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "create_gcae_input_files_2"
    ),
    n_individuals = n_individuals,
    n_random_snps = n_random_snps
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)

  expect_silent(check_gcae_input_data(gcae_input_data))

  # There is only 1 phenotype
  n_traits <- 1
  expect_equal(2 + n_traits, ncol(gcae_input_data$phe_table))

  # The first SNP is real
  n_snps <- 1 + n_random_snps

  expect_equal(n_snps, nrow(gcae_input_data$bed_table))
  expect_equal(n_individuals, ncol(gcae_input_data$bed_table))

  expect_true(
    all(
      gcae_input_data$labels_table$population %in%
        gcae_input_data$fam_table$fam
    )
  )

  # PLINK must detect a perfect association with first SNP only
  data <- plinkr::create_plink_bin_data(
    bed_table = gcae_input_data$bed_table,
    bim_table = gcae_input_data$bim_table,
    fam_table = gcae_input_data$fam_table
  )
  t <- plinkr::assoc_qt(
    assoc_qt_data = plinkr::create_assoc_qt_data(
      data = data,
      phenotype_data = plinkr::create_phenotype_data_table(
        gcae_input_data$phe_table
      )
    ),
    assoc_qt_params = plinkr::create_assoc_qt_params(
      data = data,
      phe_table = gcae_input_data$phe_table
    )
  )
  # The first p value must be lowest
  expect_equal(1, which.min(t$qassoc_table$P))
  # After Bonferroni, there is only 1 significant p value
  expect_equal(1, sum(t$qassoc_table$P < 0.05 / 1000))

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("use, 0 random SNPs", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!plinkr::is_plink_installed()) return()

  n_individuals <- 1000
  n_random_snps <- 0

  gcae_input_filenames <- create_gcae_input_files_2(
    base_input_filename = file.path(
      get_gcaer_tempfilename(),
      "create_gcae_input_files_2"
    ),
    n_individuals = n_individuals,
    n_random_snps = n_random_snps
  )
  gcae_input_data <- read_gcae_input_files(gcae_input_filenames)

  expect_silent(check_gcae_input_data(gcae_input_data))

  # There is only 1 phenotype
  n_traits <- 1
  expect_equal(2 + n_traits, ncol(gcae_input_data$phe_table))

  # The first SNP is real
  n_snps <- 1 + n_random_snps

  expect_equal(n_snps, nrow(gcae_input_data$bed_table))
  expect_equal(n_individuals, ncol(gcae_input_data$bed_table))

  expect_true(
    all(
      gcae_input_data$labels_table$population %in%
        gcae_input_data$fam_table$fam
    )
  )

  # PLINK must detect a perfect association with first SNP only
  data <- plinkr::create_plink_bin_data(
    bed_table = gcae_input_data$bed_table,
    bim_table = gcae_input_data$bim_table,
    fam_table = gcae_input_data$fam_table
  )
  t <- plinkr::assoc_qt(
    assoc_qt_data = plinkr::create_assoc_qt_data(
      data = data,
      phenotype_data = plinkr::create_phenotype_data_table(
        gcae_input_data$phe_table
      )
    ),
    assoc_qt_params = plinkr::create_assoc_qt_params(
      data = data,
      phe_table = gcae_input_data$phe_table
    )
  )
  # The first p value must be lowest
  expect_equal(1, which.min(t$qassoc_table$P))
  # After Bonferroni, there is only 1 significant p value
  expect_equal(1, sum(t$qassoc_table$P < 0.05 / 1000))

  file.remove(as.character(unlist(gcae_input_filenames)))
})

test_that("re-create", {
  if (1 == 2) {
    # Re-create the files in inst/extdata
    create_gcae_input_files_2(
      base_input_filename = "~/GitHubs/gcaer/inst/extdata/gcae_input_files_2_0",
      n_individuals = 1000,
      n_random_snps = 0
    )
    create_gcae_input_files_2(
      base_input_filename
        = "~/GitHubs/gcaer/inst/extdata/gcae_input_files_2_1000",
      n_individuals = 1000,
      n_random_snps = 1000
    )
  }
})
