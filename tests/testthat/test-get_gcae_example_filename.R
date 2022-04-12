test_that("use", {
  expect_error(get_gcae_example_filename("nonsense"))
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_script_fixed()) return()
  expect_silent(get_gcae_example_filename("HO_superpopulations"))
  expect_silent(
    get_gcae_example_filename("HumanOrigins249_tiny.eigenstratgeno")
  )
  expect_silent(get_gcae_example_filename("HumanOrigins249_tiny.fam"))
  expect_silent(get_gcae_example_filename("HumanOrigins249_tiny.snp"))
})
