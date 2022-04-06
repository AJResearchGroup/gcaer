#' Analyse the `gcae_experiment_results`
#'
#' Analyse the `gcae_experiment_results`.
#' Creates pictures
#' @inheritParams default_params_doc
#' @return the result of \link[gganimate]{animate}
#' @author Richèl J.C. Bilderbeek
#' @export
analyse_gcae_experiment_results <- function( # nolint indeed a long function name
  gcae_experiment_results,
  gcae_experiment_params
) {
  gcaer::check_gcae_experiment_results(gcae_experiment_results)
  gcaer::check_gcae_experiment_params(gcae_experiment_params)
  trainedmodeldir <- gcae_experiment_params$gcae_setup$trainedmodeldir
  readr::write_csv(
    gcae_experiment_results$scores_per_pop_table,
    file = file.path(trainedmodeldir, "scores_per_pop.csv")
  )
  readr::write_csv(
    gcae_experiment_results$scores_table,
    file = file.path(trainedmodeldir, "scores.csv")
  )
  readr::write_csv(
    gcae_experiment_results$phenotype_predictions_table,
    file = file.path(trainedmodeldir, "phenotype_predictions.csv")
  )
  readr::write_csv(
    gcae_experiment_results$train_times_table,
    file = file.path(trainedmodeldir, "train_times.csv")
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_t_table,
    file = file.path(trainedmodeldir, "losses_from_train_t.csv")
  )
  readr::write_csv(
    gcae_experiment_results$losses_from_train_v_table,
    file = file.path(trainedmodeldir, "losses_from_train_v.csv")
  )

  gcaer::create_scores_through_time_png(
    scores_table = gcae_experiment_results$scores_table,
    png_filename = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "scores_through_time.png"
    )
  )

  gcaer::create_scores_per_pop_through_time_png(
    scores_per_pop_table = gcae_experiment_results$scores_per_pop_table,
    png_filename = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "scores_per_pop_through_time.png"
    )
  )

  gcaer::create_phenotype_prediction_through_time_gif(
    phenotype_predictions_table =
      gcae_experiment_results$phenotype_predictions_table,
    gif_filename = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "phenotype_prediction_through_time.gif"
    )
  )
  gcaer::create_phenotype_prediction_quality_png(
    phenotype_predictions_table =
      gcae_experiment_results$phenotype_predictions_table,
    png_filename = file.path(
      gcae_experiment_params$gcae_setup$trainedmodeldir,
      "phenotype_prediction.png"
    )
  )

}
