#' Create the parameters for a GCAE experiment
#'
#' Create the parameters for a GCAE experiment
#' @inheritParams default_params_doc
#' @return the parameters for a GCAE experiment
#' @examples
#' create_test_gcae_experiment_params()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_gcae_experiment_params <- function( # nolint indeed a long function name
  gcae_setup = create_test_gcae_setup(),
  analyse_epochs = c(1, 2),
  metrics = "f1_score_3,f1_score_5",
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::create_gcae_experiment_params(
    gcae_setup = gcae_setup,
    analyse_epochs = analyse_epochs,
    metrics = metrics,
    gcae_options = gcae_options,
    verbose = verbose
  )
}
