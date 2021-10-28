test_that("use", {

  get_python_binary_path()
  expect_equal(2 * 2, 4)
})
