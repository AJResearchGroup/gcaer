test_that("use", {
  expect_true(
    stringr::str_detect(get_default_ormr_folder_name(), "ormr_gcaer$")
  )
})
