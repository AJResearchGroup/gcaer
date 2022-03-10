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
  full_phe_table <- dplyr::full_join(
    input_phe_table,
    results_phe_table,
    by = c("FID", "IID")
  )
  HIERO
  full_phe_table$predicted_phenotype_squared <-
    full_phe_table$predicted_phenotype ^ 2
  full_phe_table$predicted_phenotype_cubed <-
    full_phe_table$predicted_phenotype ^ 3

  linear_model <- lm(
    true_phenotype ~ predicted_phenotype,
    data = full_phe_table
  )
  t_linear <- broom::tidy(linear_model)
  t_linear$model <- "linear"
  quadratic_model <- lm(
    true_phenotype ~ predicted_phenotype + predicted_phenotype_squared,
    data = full_phe_table
  )
  t_quadratic <- broom::tidy(quadratic_model)
  t_quadratic$model <- "quadratic"
  cubic_model <- lm(
    true_phenotype ~ predicted_phenotype +
      predicted_phenotype_squared +
      predicted_phenotype_cubed,
    data = full_phe_table
  )
  t_cubic <- broom::tidy(cubic_model)
  t_cubic$model <- "cubic"
  t <- dplyr::bind_rows(t_linear, t_quadratic, t_cubic)

  correlation::correlation(full_phe_table)
  correlation::correlation(full_phe_table, method = "distance")
  model <- lm(
    predicted_phenotype~true_phenotype,
    data = full_phe_table
  )
  summary(model)
  model <- lm(
    predicted_phenotype^2~true_phenotype,
    data = full_phe_table
  )

  ggplot2::ggplot(
    full_phe_table,
    ggplot2::aes(x = true_phenotype, y = predicted_phenotype)
  ) + ggplot2::geom_point() +
    ggplot2::geom_abline(slope = 1, lty = "dashed") +
    ggplot2::geom_smooth(method = "lm", se = TRUE, col = "red") +
    ggplot2::geom_smooth(method = "lm", formula = y ~ x + I(x^2), se = TRUE, col = "blue") +
    ggplot2::geom_smooth(method = "lm", formula = y ~ x + I(x^3), se = TRUE, col = "green")

  ggplot2::ggsave("~/20220304_issue_122.png", width = 7, height = 7)

}
