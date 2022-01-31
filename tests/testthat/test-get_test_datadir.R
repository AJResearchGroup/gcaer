test_that("simply the gcaer inst/extdata folder", {
  expect_equal(
    get_test_datadir(),
    paste0(system.file("extdata", package = "gcaer"), "/")
  )
})
