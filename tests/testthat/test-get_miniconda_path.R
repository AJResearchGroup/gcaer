test_that("use", {
  expect_equal(basename(reticulate::miniconda_path()), "r-miniconda")
  gcae_folder <- "~/.local/share/gcaer"
  expect_equal(
    get_miniconda_path(create_gcae_options(gcae_folder = gcae_folder)),
    "~/.local/share/gcaer/r-miniconda"
  )
})
