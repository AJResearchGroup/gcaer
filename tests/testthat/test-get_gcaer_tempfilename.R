test_that("use", {
  expect_silent(get_gcaer_tempfilename())
  expect_silent(get_gcaer_tempfilename(pattern = "test"))
  expect_silent(get_gcaer_tempfilename(fileext = ".xml"))
})
