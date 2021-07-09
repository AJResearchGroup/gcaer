test_that("use", {
  genotype_concordances_filename <- get_gcaer_filename(
    "genotype_concordances.csv"
  )
  expect_silent(
    parse_genotype_concordances_file(genotype_concordances_filename)
  )
})
