test_that("use", {
  scores_table <- create_test_scores_table()
  expect_silent(check_scores_table(scores_table))
})
