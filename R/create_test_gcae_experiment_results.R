#' Create a `gcae_experiment_results` to be used in testing
#'
#' Create a `gcae_experiment_results` to be used in testing
#' @return a `gcae_experiment_results`
#' @examples
#' create_test_gcae_experiment_results()
#' check_gcae_experiment_results(create_test_gcae_experiment_results())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_gcae_experiment_results <- function() { # nolint indeed a long function name
  list(
    score_per_pop_table = gcaer::create_test_score_per_pop_table(),
    scores_table = gcaer::create_test_scores_table(),
    genotype_concordances_table
      = gcaer::create_test_genotype_concordances_table(),
    phenotype_predictions_table
      = gcaer::create_test_phenotype_predictions_table(),
    nmse_in_time_table = gcaer::create_test_nmse_in_time_table(),
    train_times_table = gcaer::create_test_train_times_table(),
    losses_from_train_t_table
      = gcaer::create_test_losses_from_train_t_table(),
    losses_from_train_v_table
      = gcaer::create_test_losses_from_train_v_table()
  )
}
