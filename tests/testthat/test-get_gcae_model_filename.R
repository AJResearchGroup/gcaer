test_that("use", {
  if (!is_gcae_installed()) return()
  model_filename <- get_gcae_model_filename("M0")
  expect_true(file.exists(model_filename))
})
