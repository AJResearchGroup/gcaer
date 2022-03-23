test_that("use", {
  if (!is_gcae_installed()) return()
  model_filename <- get_gcae_model_filename("M1")
  expect_true(file.exists(model_filename))
  model <- read_model_file(model_filename)
  png_filename <- get_gcaer_tempfilename(fileext = ".png")
  save_model_plot(
    model = model,
    png_filename = png_filename
  )
  expect_true(file.exists(png_filename))
  file.remove(png_filename)
})
