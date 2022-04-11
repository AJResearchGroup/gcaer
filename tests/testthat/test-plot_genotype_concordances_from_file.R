test_that("use", {
  genotype_concordances_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_genotype_concordances_table(),
    file = genotype_concordances_filename
  )
  expect_true(file.exists(genotype_concordances_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_genotype_concordances_from_file(
    genotype_concordances_filename = genotype_concordances_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(genotype_concordances_filename)
  file.remove(png_filename)
})
