test_that("use", {
  losses_from_train_t_filename <- get_gcaer_filename("losses_from_train_t.csv")
  expect_silent(
    parse_losses_from_train_t_file(losses_from_train_t_filename)
  )
})
