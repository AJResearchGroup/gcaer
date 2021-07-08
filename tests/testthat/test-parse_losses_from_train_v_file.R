test_that("use", {
  losses_from_train_v_filename <- get_gcaer_filename("losses_from_train_v.csv")
  expect_silent(
    parse_losses_from_train_v_file(losses_from_train_v_filename)
  )
})
