test_that("use", {
  scores_per_pop_table <- create_test_scores_per_pop_table()
  expect_silent(check_scores_per_pop_table(scores_per_pop_table))
})
