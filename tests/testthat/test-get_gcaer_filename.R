test_that("use", {
  expect_error(get_gcaer_filename("abs.ent"))
  skip("Not yet")
  expect_silent(get_gcaer_filename("gcae.log"))
})
