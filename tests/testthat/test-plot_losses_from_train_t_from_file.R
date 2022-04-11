test_that("use", {

  losses_from_train_t_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_losses_from_train_t_table(),
    file = losses_from_train_t_filename
  )
  expect_true(file.exists(losses_from_train_t_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_losses_from_train_t_from_file(
    losses_from_train_t_filename = losses_from_train_t_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(losses_from_train_t_filename)
  file.remove(png_filename)
})
