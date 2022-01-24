test_that("use", {
  expect_equal(
    get_default_ormr_folder_name(),
    file.path(get_gcae_folder())
  )
})
