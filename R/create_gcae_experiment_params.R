#' Create the GCAE setup
#'
#' Create the GCAE setup
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @examples
#' create_gcae_setup(
#'   datadir = "my_datadir/",
#'   data = "HumanOrigins249_tiny",
#'   superpops = "HO_superpopulations",
#'   model_id = "M1",
#'   train_opts_id = "ex3",
#'   data_opts_id = "b_0_4",
#'   pheno_model_id = "p2",
#'   trainedmodeldir = "ae_out/"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_experiment_params <- function(
  gcae_options,
  gcae_setup,
  analyse_epochs
) {
  gcaer::check_gcae_options(gcae_options)
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_analyse_epochs(analyse_epochs)

  list(
    gcae_options = gcae_options,
    gcae_setup = gcae_setup,
    analyse_epochs = analyse_epochs
  )
}
