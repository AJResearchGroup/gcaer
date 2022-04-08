#' Parse the data from the files produced by \link{gcae_evaluate}
#'
#' Parse the data from the files produced by \link{gcae_evaluate}
#' @inheritParams default_params_doc
#' @return a list of tibbles
#'  * `x`: x
#' @author Richèl J.C. Bilderbeek
#' @export
parse_evaluate_filenames <- function(
  evaluate_filenames,
  epoch
) {
  gcaer::check_epoch(epoch)
  score_per_pop_filename <- stringr::str_subset(
    string = evaluate_filenames,
    pattern = paste0("_pops_epoch_", epoch)
  )
  if (length(score_per_pop_filename) != 1) {
    stop(
      "Must detect exactly one filename containing '_pops_epoch_'. \n",
      "Number of matches: ", length(score_per_pop_filename), " \n",
      "Matches: \n * ", paste0(score_per_pop_filename, collapse = "\n * "),
      " \n",
      "'evaluate_filenames': ",
        "\n * ",
        paste0(evaluate_filenames, collapse = "\n * ")
    )
  }
  testthat::expect_equal(1, )
  testthat::expect_true(file.exists(score_per_pop_filename))
  not_score_per_pop_filenames <- stringr::str_subset(
    evaluate_filenames,
    "_pops_",
    negate = TRUE
  )
  scoreses <- list() # Reduplicated plural
  for (i in seq_along(not_score_per_pop_filenames)) {
    not_score_per_pop_filename <- not_score_per_pop_filenames[i]
    score_name <- tools::file_path_sans_ext(
      basename(not_score_per_pop_filename)
    )
    t <- readr::read_csv(not_score_per_pop_filename, show_col_types = FALSE)
    testthat::expect_equal(1, nrow(t))
    testthat::expect_equal(1, ncol(t))
    value <- as.numeric(t[1, 1])
    t <- tibble::tibble(
      score = score_name,
      value = value
    )
    scoreses[[i]] <- t
  }
  t_scores <- dplyr::bind_rows(scoreses)
  t_score_per_pop <- gcaer::parse_score_per_pop_file(score_per_pop_filename)
  list(
    t_score_per_pop = t_score_per_pop,
    t_scores = t_scores
  )
}
