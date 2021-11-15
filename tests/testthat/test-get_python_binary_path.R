test_that("use", {
  python_binary_path <- get_python_binary_path()
  expect_true(
    stringr::str_detect(
      string = python_binary_path,
      pattern = "r-miniconda.envs.r-reticulate.bin.python"
    )
  )
})
