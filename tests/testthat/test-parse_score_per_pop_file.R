test_that("use", {
  score_per_pop_filename <- get_gcaer_filename("f1_scores_pops_epoch_1.csv")
  t <- parse_score_per_pop_file(score_per_pop_filename)
  expect_equal(names(t), c("population", "name", "value"))
})

test_that("abuse", {
  expect_error(
    parse_score_per_pop_file(
      c(
        "f1_scores_pops_epoch_1.csv",
        "f1_scores_pops_epoch_1.csv"
      )
    ),
    "'score_per_pop_filename' must have length 1"
  )
})
