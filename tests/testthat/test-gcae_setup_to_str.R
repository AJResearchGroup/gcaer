test_that("minimal use", {
  expect_silent(gcae_setup_to_str(gcae_setup = create_test_gcae_setup()))
})

test_that("use", {
  str <- gcae_setup_to_str(create_test_gcae_setup())
  expect_true(length(str) > 0)
})
