test_that("use", {
  model_filename <- get_gcae_model_filename("M0")
  expect_true(file.exists(model_filename))
})
