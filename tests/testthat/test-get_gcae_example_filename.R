test_that("use", {
  expect_error(get_gcae_example_filename("nonsense"))
  if (!is_gcae_installed()) return()
  expect_silent(get_gcae_example_filename("HO_superpopulations"))
  expect_silent(
    get_gcae_example_filename("HumanOrigins249_tiny.eigenstratgeno")
  )
  expect_silent(get_gcae_example_filename("HumanOrigins249_tiny.fam"))
  expect_silent(get_gcae_example_filename("HumanOrigins249_tiny.snp"))
})
