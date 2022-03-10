#' Determine how well the quantitative trait prediction worked
#'
#' @inheritParams default_params_doc
#' @param unique_id the unique identifier of that setting
#' @return Nothing. Will create some files.
#' @author Richèl J.C. Bilderbeek
#' @export
analyse_qt_prediction <- function(
  datadir,
  trainedmodeldir,
  unique_id,
  verbose = FALSE
) {

  input_phe_filename <- list.files(
    path = datadir,
    pattern = "\\.phe$",
    full.names = TRUE
  )
  message("input_phe_filename: ", input_phe_filename)
  testthat::expect_equal(length(input_phe_filename), 1)
  testthat::expect_true(file.exists(input_phe_filename))
  results_phe_filename <- list.files(
    path = trainedmodeldir,
    pattern = "\\.phe$",
    full.names = TRUE,
    recursive = TRUE
  )
  testthat::expect_equal(length(results_phe_filename), 1)
  testthat::expect_true(file.exists(results_phe_filename))

  # Take the predicted phenotypes
  input_phe_table <- plinkr::read_plink_phe_file(input_phe_filename)
  if (verbose) {
    message(
      "head(input_phe_table): \n",
      paste0(knitr::kable(utils::head(input_phe_table)), collapse = "\n")
    )
  }

  results_phe_table <- plinkr::read_plink_phe_file(results_phe_filename)
  message(
    "head(results_phe_table): \n",
    paste0(knitr::kable(utils::head(results_phe_table)), collapse = "\n")
  )

  testthat::expect_equal(
    input_phe_table$FID,
    results_phe_table$FID
  )
  testthat::expect_equal(
    input_phe_table$IID,
    results_phe_table$IID
  )
  names(input_phe_table) <- c(
    names(input_phe_table)[-3],
    "true_phenotype"
  )
  names(results_phe_table) <- c(
    names(results_phe_table)[-3],
    "predicted_phenotype"
  )
  full_phe_table <- dplyr::full_join(input_phe_table, results_phe_table)

  ggplot2::ggplot(
    full_phe_table,
    ggplot2::aes(x = true_phenotype, y = predicted_phenotype)
  ) + ggplot2::geom_point() +
    ggplot2::geom_abline(slope = 1, lty = "dashed") +
    ggplot2::geom_smooth(method = "lm", se = TRUE, col = "red")
  ggplot2::ggsave("~/20220304_issue_122.png", width = 7, height = 7)

}
