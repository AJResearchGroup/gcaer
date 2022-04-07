test_that("use", {
  score_per_pop_table <- create_test_score_per_pop_table()
  expect_silent(check_score_per_pop_table(score_per_pop_table))
})
