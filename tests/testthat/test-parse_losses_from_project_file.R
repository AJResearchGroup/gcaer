test_that("use", {
  losses_from_project_filename <- get_gcaer_filename("losses_from_project.csv")
  expect_silent(
    parse_losses_from_project_file(losses_from_project_filename)
  )
})
