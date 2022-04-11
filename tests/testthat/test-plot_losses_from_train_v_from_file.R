test_that("use", {

  losses_from_train_v_filename <- get_gcaer_tempfilename(fileext = ".csv")
  readr::write_csv(
    x = create_test_losses_from_train_v_table(),
    file = losses_from_train_v_filename
  )
  expect_true(file.exists(losses_from_train_v_filename))

  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  plot_losses_from_train_v_from_file(
    losses_from_train_v_filename = losses_from_train_v_filename,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(losses_from_train_v_filename)
  file.remove(png_filename)
})
