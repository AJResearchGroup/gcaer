#' Determine how well the quantitative trait prediction worked
#'
#' @inheritParams default_params_doc
#' @return the plot
#' @author Richèl J.C. Bilderbeek
#' @export
evaluate_phenotype_prediction <- function(
  gcae_experiment_params,
  epoch,
  verbose = FALSE
) {
  true_phenotype <- NULL; rm(true_phenotype) # nolint, fixes warning: no visible binding for global variable
  predicted_phenotype <- NULL; rm(predicted_phenotype) # nolint, fixes warning: no visible binding for global variable
  normalized_true_phenotype <- NULL; rm(normalized_true_phenotype) # nolint, fixes warning: no visible binding for global variable
  normalized_predicted_phenotype <- NULL; rm(normalized_predicted_phenotype) # nolint, fixes warning: no visible binding for global variable
  ..eq.label.. <- NULL; rm(..eq.label..) # nolint, fixes warning: no visible binding for global variable
  ..rr.label.. <- NULL; rm(..rr.label..) # nolint, fixes warning: no visible binding for global variable

  gcaer::check_gcae_experiment_params(gcae_experiment_params)
  gcaer::check_epoch(epoch)
  plinkr::check_verbose(verbose)


  testthat::expect_true(dir.exists(gcae_experiment_params$gcae_setup$datadir))
  input_phe_filename <- list.files(
    path = gcae_experiment_params$gcae_setup$datadir,
    pattern = paste0(gcae_experiment_params$gcae_setup$data, "\\.phe$"),
    full.names = TRUE
  )
  if (verbose) {
    message("input_phe_filename: ", input_phe_filename)
  }
  testthat::expect_equal(length(input_phe_filename), 1)
  testthat::expect_true(file.exists(input_phe_filename))

  testthat::expect_true(
    dir.exists(gcae_experiment_params$gcae_setup$trainedmodeldir)
  )
  results_phe_filename <- list.files(
    path = gcae_experiment_params$gcae_setup$trainedmodeldir,
    pattern = paste0(epoch, "\\.phe$"),
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
  phenotype_predictions_table <- dplyr::full_join(
    input_phe_table,
    results_phe_table,
    by = c("FID", "IID")
  )
  if (1 == 2) {
    normalized_values <- gcaer::normalize_true_and_estimated_values(
      true_values = phenotype_predictions_table$true_phenotype,
      estimated_values = phenotype_predictions_table$predicted_phenotype
    )
    phenotype_predictions_table$normalized_true_phenotype <-
      normalized_values$normalized_true_values
    phenotype_predictions_table$normalized_predicted_phenotype <-
      normalized_values$normalized_estimated_values

    mse_from_identity_line <- calc_mse_from_identity_line(
      true_values = predictions_table$true_phenotype,
      estimated_values = predictions_table$predicted_phenotype
    )
    nmse_from_identity_line <- calc_nmse_from_identity_line(
      true_values = predictions_table$true_phenotype,
      estimated_values = predictions_table$predicted_phenotype
    )
    error_table <- tibble::tibble(
      mse_from_identity_line = mse_from_identity_line,
      nmse_from_identity_line = nmse_from_identity_line
    )

    # True values
    x_axis_min <- min(0.0, min(phenotype_predictions_table$true_phenotype))
    x_axis_max <- max(0.0, max(phenotype_predictions_table$true_phenotype))
    y_axis_min <- min(0.0, min(phenotype_predictions_table$predicted_phenotype))
    y_axis_max <- max(0.0, max(phenotype_predictions_table$predicted_phenotype))
    #
    true_values_prediction_quality_plot <- ggplot2::ggplot(# nolint indeed a long variable name
      phenotype_predictions_table,
      ggplot2::aes(x = true_phenotype, y = predicted_phenotype)
    ) + ggplot2::geom_abline(slope = 1, intercept = 0, lty = "dashed") +
      ggplot2::geom_point() +
      ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
      ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max))
    #
    true_values_prediction_quality_plot
    # Normalized values
    x_axis_min <- min(0.0, min(
      phenotype_predictions_table$normalized_true_phenotype)
    )
    x_axis_max <- max(0.0, max(
      phenotype_predictions_table$normalized_true_phenotype)
    )
    y_axis_min <- min(0.0, min(
      phenotype_predictions_table$normalized_predicted_phenotype)
    )
    y_axis_max <- max(0.0, max(
      phenotype_predictions_table$normalized_predicted_phenotype)
    )
    #
    normalized_values_prediction_quality_plot <- ggplot2::ggplot(# nolint indeed a long variable name
      phenotype_predictions_table,
      ggplot2::aes(
        x = normalized_true_phenotype,
        y = normalized_predicted_phenotype
      )
    ) + ggplot2::geom_abline(slope = 1, intercept = 0, lty = "dashed") +
      ggplot2::geom_point() +
      ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
      ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max))
    normalized_values_prediction_quality_plot
  }
  phenotype_predictions_table
}
