test_that("use", {
  expect_error(
    uninstall_gcae("nonsense"),
    "must be a list"
  )
})

test_that("use", {
  expect_error(
    uninstall_gcae(
      gcae_options = create_gcae_options(gcae_folder = "abs.ent")
    ),
    "Cannot uninstall a GCAE version that is absent"
  )
})
