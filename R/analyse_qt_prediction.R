#' Determine how well the quantitative trait prediction worked
#'
#' @inheritParams default_params_doc
#' @return the plot
#' @author Richèl J.C. Bilderbeek
#' @export
analyse_qt_prediction <- function(
  datadir,
  trainedmodeldir,
  png_filename,
  csv_filename_for_nmse,
  verbose = FALSE
) {
  gcaer::check_datadir(datadir)
  gcaer::check_trainedmodeldir(trainedmodeldir)
  gcaer::check_png_filename(png_filename)
  gcaer::check_csv_filename(csv_filename_for_nmse)
  plinkr::check_verbose(verbose)

  testthat::expect_true(dir.exists(datadir))
  testthat::expect_true(dir.exists(trainedmodeldir))

  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable
  ..eq.label.. <- NULL; rm(..eq.label..) # nolint, fixes warning: no visible binding for global variable
  ..rr.label.. <- NULL; rm(..rr.label..) # nolint, fixes warning: no visible binding for global variable

  input_phe_filename <- list.files(
    path = datadir,
    pattern = "\\.phe$",
    full.names = TRUE
  )
  if (verbose) {
    message("input_phe_filename: ", input_phe_filename)
  }
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
  if (verbose && "never show" == "this") {
    # Never show this, because this can be sensitive data
    # Also, don't scramble, it is hard to depersonalize these
    message(
      "head(input_phe_table): \n",
      paste0(knitr::kable(utils::head(input_phe_table)), collapse = "\n")
    )
  }

  results_phe_table <- plinkr::read_plink_phe_file(results_phe_filename)
  if (verbose) {
    message(
      "head(results_phe_table): \n",
      paste0(knitr::kable(utils::head(results_phe_table)), collapse = "\n")
    )
  }

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
  nmse_from_identity_line <- calc_nmse_from_identity_line(
    true_values = full_phe_table$true_phenotype,
    estimated_values = full_phe_table$predicted_phenotype
  )
  t_mse <- tibble::tibble(
    nmse = nmse_from_identity_line
  )
  readr::write_csv(x = t_mse, file = csv_filename_for_nmse)

  x_axis_min <- min(0.0, min(full_phe_table$true_phenotype))
  x_axis_max <- max(0.0, max(full_phe_table$true_phenotype))
  y_axis_min <- min(0.0, min(full_phe_table$predicted_phenotype))
  y_axis_max <- max(0.0, max(full_phe_table$predicted_phenotype))

  trendline_formula <- y ~ x
  p <- ggplot2::ggplot(
    full_phe_table,
    ggplot2::aes(x = true_phenotype, y = predicted_phenotype)
  ) + ggplot2::geom_abline(slope = 1, intercept = 0, lty = "dashed") +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
    ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max))
    p
  ggplot2::ggsave(png_filename, width = 7, height = 7)
  p
}
