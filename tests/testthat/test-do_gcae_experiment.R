test_that("use", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_options = create_gcae_options(),
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
    ),
    analyse_epochs = c(1, 2),
    metrics = "f1_score_3,f1_score_5"
  )
  gcae_experiment_results <- do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )
  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
})

test_that("use, M1", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
    ),
    analyse_epochs = seq(10, 100, by = 10),
    metrics = paste0(paste0("f1_score_", seq(3, 19, by = 2)), collapse = ","),
    gcae_options = create_gcae_options()
  )
  Sys.time() # 2022-03-31 19:32:08 CEST"
  gcae_experiment_results <- do_gcae_experiment(
    gcae_experiment_params = gcae_experiment_params
  )
  Sys.time() # "2022-03-31 22:43:05 CEST"

  x_axis_min <- min(0.0, min(gcae_experiment_results$phenotype_predictions_table$true_phenotype))
  x_axis_max <- max(0.0, max(gcae_experiment_results$phenotype_predictions_table$true_phenotype))
  y_axis_min <- min(0.0, min(gcae_experiment_results$phenotype_predictions_table$predicted_phenotype))
  y_axis_max <- max(0.0, max(gcae_experiment_results$phenotype_predictions_table$predicted_phenotype))

  p <- ggplot2::ggplot(
    gcae_experiment_results$phenotype_predictions_table,
    ggplot2::aes(true_phenotype, predicted_phenotype, color = FID)
  ) +
    ggplot2::geom_point() +
    ggplot2::geom_abline(ggplot2::aes(slope = 1, intercept = 0), lty = "dashed") +
    ggplot2::scale_x_continuous(limits = c(x_axis_min, x_axis_max)) +
    ggplot2::scale_y_continuous(limits = c(y_axis_min, y_axis_max)) +
    bbbq::get_bbbq_theme() +
    # Here comes the gganimate specific bits
    ggplot2::labs(title = "Epoch: {frame_time}") +
    gganimate::transition_time(epoch) +
    gganimate::ease_aes()


  gganimate::animate(
    plot = p,
    res = 300,
    height = 7, width = 7,
    units = "in",
    nframes = length(unique(gcae_experiment_results$phenotype_predictions_table$epoch)),
    renderer = gganimate::gifski_renderer(
      file = "/home/richel/here.gif"
    )
  )
  # gganimate::animate(
  #   p,
  #   nframes = length(unique(gcae_experiment_results$phenotype_predictions_table$epoch)),
  #   renderer = gganimate::magick_renderer()
  # )
  #
  # gganimate::animate(
  #   p,
  #   nframes = length(unique(gcae_experiment_results$phenotype_predictions_table$epoch)),
  #   renderer = gganimate::sprite_renderer()
  # )
  #
  #
  # gganimate::animate(
  #   p,
  #   nframes = length(unique(gcae_experiment_results$phenotype_predictions_table$epoch)),
  #   renderer = gganimate::av_renderer(
  #     file = "/home/richel/here.mpeg"
  #   )
  # )


  gcae_experiment_results_filename = gcae_experiment_params$
  save_gcae_experiment_results(
    gcae_experiment_results = gcae_experiment_results
    gcae_experiment_results_filename = gcae_experiment_params$
  )
  gcae_experiment_results

  expect_silent(check_gcae_experiment_results(gcae_experiment_results))
})

test_that("profiling, M1", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!plinkr::is_on_ci()) return()
  if (!is_gcae_installed()) return()
  clean_gcaer_tempfolder()
  gcae_experiment_params <- create_gcae_experiment_params(
    gcae_setup = create_test_gcae_setup(
      model_id = "M0",
      superpops = get_gcaer_filename("gcae_input_files_1_labels.csv")
    ),
    analyse_epochs = seq(10, 100, by = 10),
    metrics = paste0(paste0("f1_score_", seq(3, 19, by = 2)), collapse = ","),
    gcae_options = create_gcae_options()
  )
  Sys.time() # 2022-03-31 19:32:08 CEST"
  profvis::profvis({
    do_gcae_experiment(gcae_experiment_params = gcae_experiment_params)
  })
  Sys.time() # "2022-03-31 22:43:05 CEST"

})
