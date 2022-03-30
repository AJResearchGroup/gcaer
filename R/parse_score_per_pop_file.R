#' Parse the `f1_scores_pops_epoch_[x].csv` file
#' produced by \link{gcae_evaluate}
#'
#' Parse the `f1_scores_pops_epoch_[x].csv` file
#' produced by \link{gcae_evaluate}
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @examples
#' score_per_pop_filename <- get_gcaer_filename("f1_scores_pops_epoch_1.csv")
#' parse_score_per_pop_file(score_per_pop_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
parse_score_per_pop_file <- function(score_per_pop_filename) {
  testthat::expect_equal(1, length(score_per_pop_filename))
  testthat::expect_true(file.exists(score_per_pop_filename))

  population <- NULL; rm(population) # nolint, fixes warning: no visible binding for global variable

  t_per_pop_raw <- readr::read_csv(
    score_per_pop_filename,
    col_types = readr::cols(
      Population = readr::col_character(), # nolint GCAE naming
      `num samples` = readr::col_double(), # nolint GCAE naming
      f1_score_3 = readr::col_double(),
      f1_score_5 = readr::col_double()
    )
  )
  # Remove the averages, they appear to be miscalculated,
  # see https://github.com/richelbilderbeek/gcaer/issues/14                     # nolint
  #
  # |Population  | num samples| f1_score_3| f1_score_5|                         # nolint
  # |:-----------|-----------:|----------:|----------:|                         # nolint
  # |C           |         333|     0.0000|     0.0000|                         # nolint
  # |B           |         334|     0.2431|     0.0000|                         # nolint
  # |A           |         333|     0.4400|     0.4996|                         # nolint
  # |avg (micro) |        1000|     0.3100|     0.3330|                         # nolint
  t_per_pop_wide <- t_per_pop_raw[-nrow(t_per_pop_raw), ]
  testthat::expect_equal(
    names(t_per_pop_wide)[1:2],
    c("Population", "num samples") # Names from GCAE
  )
  new_names <- names(t_per_pop_wide)
  new_names[1] <- "population"
  new_names[2] <- "n_samples"
  names(t_per_pop_wide) <- new_names
  t_per_pop_wide

  # Convert to wide
  t_per_pop <- tidyr::pivot_longer(
    data = t_per_pop_wide,
    cols = c(!population)
  )
  # This will do ...
  testthat::expect_equal(names(t_per_pop), c("population", "name", "value"))

  t_per_pop
}
