test_that("use, example file", {
  json_1 <- read_model_file(get_gcaer_filename("M0.json"))
  expect_true(is_equal_json(json_1, json_1))
})

test_that("use, different length", {
  json_1 <- read_model_file(get_gcaer_filename("M0.json"))
  json_2 <- list()
  expect_false(is_equal_json(json_1, json_2))
})

test_that("use, GCAE files", {
  if (!is_gcae_script_fixed()) return()
  json_1 <- read_model_file(get_gcae_model_filename("M0"))
  json_2 <- read_model_file(get_gcae_model_filename("M1"))
  expect_true(is_equal_json(json_1, json_1))
  expect_true(is_equal_json(json_2, json_2))
  expect_false(is_equal_json(json_1, json_2))
  expect_false(is_equal_json(json_2, json_1))
})
