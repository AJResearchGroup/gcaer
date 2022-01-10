test_that("use", {
  file_path_before <- "~/.local/share/gcaer/gcae_v1_0/example_tiny//HO_superpopulations"
  file_path_after <- "~/.local/share/gcaer/gcae_v1_0/example_tiny/HO_superpopulations"
  expect_equal(clean_file_path(file_path_before), file_path_after)
})
