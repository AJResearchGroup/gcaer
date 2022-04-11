test_that("use", {
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  create_genotype_concordances_through_time_png(
    genotype_concordances_table = create_test_genotype_concordances_table(),
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
