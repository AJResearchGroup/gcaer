test_that("use", {
  expect_error(
    uninstall_gcae("nonsense"),
    "must be a list"
  )
})
