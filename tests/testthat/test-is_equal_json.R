test_that("use", {
  if (!is_gcae_installed()) return()
  json_1 <- read_model_file(get_gcae_model_filename("M0"))
  json_2 <- read_model_file(get_gcae_model_filename("M1"))
  expect_true(is_equal_json(json_1, json_1))
  expect_true(is_equal_json(json_2, json_2))
  expect_false(is_equal_json(json_1, json_2))
  expect_false(is_equal_json(json_2, json_1))
})
