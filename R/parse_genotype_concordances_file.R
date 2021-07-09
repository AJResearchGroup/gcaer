#' Parse the `genotype_concordances.csv` file
#'
#' Parse the `genotype_concordances.csv` file
#' @inheritParams default_params_doc
#' @return a tibble with columns:
#'  * `n`: the epoch
#'  * `t`: the time this epoch took, in seconds
#' @author Richèl J.C. Bilderbeek
#' @export
parse_genotype_concordances_file <- function(genotype_concordances_filename) { # nolint indeed a long function name
  testthat::expect_true(file.exists(genotype_concordances_filename))
  text <- readr::read_lines(file = genotype_concordances_filename)
  text_matrix <- stringr::str_split(text, pattern = ",", simplify = TRUE)
  testthat::expect_equal(2, nrow(text_matrix))
  t <- tibble::tibble(
    epoch = as.numeric(text_matrix[1, ]),
    genotype_concordances = as.numeric(text_matrix[2, ])
  )
  t
}
