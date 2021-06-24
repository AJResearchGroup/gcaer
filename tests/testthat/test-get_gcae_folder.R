test_that("use", {
  expect_equal(
    get_gcae_folder(),
    rappdirs::user_data_dir(appname = "gcaer")
  )
})
