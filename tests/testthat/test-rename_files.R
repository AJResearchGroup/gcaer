test_that("use", {
  tempfile_1 <- gcaer::get_gcaer_tempfilename()
  tempfile_2 <- gcaer::get_gcaer_tempfilename()
  tempfile_3 <- gcaer::get_gcaer_tempfilename()
  tempfile_4 <- gcaer::get_gcaer_tempfilename()

  expect_error(rename_files(tempfile_1, ""))
  expect_error(rename_files("", tempfile_1))
  expect_error(rename_files(tempfile_1, tempfile_1))
  expect_error(rename_files(tempfile_1, c(tempfile_2, tempfile_3)))

  # Actually use it
  file.create(tempfile_1)
  file.create(tempfile_2)
  expect_true(file.exists(tempfile_1))
  expect_true(file.exists(tempfile_2))
  expect_false(file.exists(tempfile_3))
  expect_false(file.exists(tempfile_4))

  rename_files(c(tempfile_1, tempfile_2), c(tempfile_3, tempfile_4))
  expect_false(file.exists(tempfile_1))
  expect_false(file.exists(tempfile_2))
  expect_true(file.exists(tempfile_3))
  expect_true(file.exists(tempfile_4))

  file.remove(tempfile_3)
  file.remove(tempfile_4)
})
