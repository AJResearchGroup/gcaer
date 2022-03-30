test_that("use", {
  evaluate_filenames <- c(
    get_gcaer_filename("f1_score_3.csv"),
    get_gcaer_filename("f1_score_5.csv"),
    get_gcaer_filename("f1_scores_pops_epoch_1.csv")
  )
  evaluate_results <- parse_evaluate_filenames(
    evaluate_filenames = evaluate_filenames,
    epoch = 1
  )
  expect_silent(check_evaluate_results(evaluate_results))
})
