test_that("use", {
  losses_from_train_v_table <- create_test_losses_from_train_v_table()
  check_losses_from_train_v_table(losses_from_train_v_table)
})
