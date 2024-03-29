#' Create the parameters for a GCAE experiment
#'
#' Create the parameters for a GCAE experiment
#' @inheritParams default_params_doc
#' @return the parameters for a GCAE experiment
#' @examples
#' create_gcae_experiment_params(
#'   gcae_setup = create_test_gcae_setup(),
#'   analyse_epochs = seq(1, 2, 3),
#'   metrics = "f1_score_3,f1_score_3"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_experiment_params <- function(
  gcae_setup,
  analyse_epochs,
  metrics,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_analyse_epochs(analyse_epochs)
  gcaer::check_metrics(metrics)
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)

  list(
    gcae_setup = gcae_setup,
    analyse_epochs = analyse_epochs,
    metrics = metrics,
    gcae_options = gcae_options,
    verbose = verbose
  )
}
