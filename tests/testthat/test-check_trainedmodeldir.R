test_that("use", {
  expect_silent(check_trainedmodeldir("my_trainedmodeldir/"))
  expect_error(check_trainedmodeldir("my_trainedmodeldir"))
  expect_error(check_trainedmodeldir(c(1, 1)))
  expect_error(check_trainedmodeldir(0))
  expect_error(check_trainedmodeldir(-1))
  expect_error(check_trainedmodeldir(""))
  expect_error(check_trainedmodeldir(c()))
  expect_error(check_trainedmodeldir(NA))
  expect_error(check_trainedmodeldir(NULL))
  expect_error(check_trainedmodeldir(Inf))
  expect_error(check_trainedmodeldir(42))
  expect_error(check_trainedmodeldir(3.14))
})
