test_that("use", {
  score_per_pop_filename <- get_gcaer_filename("f1_scores_pops_epoch_1.csv")
  t <- parse_score_per_pop_file(score_per_pop_filename)
  expect_equal(names(t), c("population", "name", "value"))
})
