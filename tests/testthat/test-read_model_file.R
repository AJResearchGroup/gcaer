test_that("use, example file", {
  model_filename <- get_gcaer_filename("M0.json")
  model <- read_model_file(model_filename)
})

test_that("use, GCAE file", {
  if (!is_gcae_script_fixed()) return()
  model_filename <- get_gcae_model_filename("M1")
  model <- read_model_file(model_filename)
})

test_that("abuse, invalid file", {

  model_filename <- get_gcaer_tempfilename(pattern = "M", fileext = ".json")
  file.copy(
    from = get_gcaer_filename("train_times.csv"),
    to = model_filename
  )
  expect_error(
    read_model_file(model_filename = model_filename),
    "Cannot parse JSON"
  )
})
