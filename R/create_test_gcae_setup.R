#' Create a GCAE setup to be used in testing
#'
#' Create a GCAE setup to be used in testing
#' @inheritParams default_params_doc
#' @return a GCAE setup
#' @examples
#' create_test_gcae_setup()
#' check_gcae_setup(create_test_gcae_setup())
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_gcae_setup <- function(
  datadir= "example_tiny/",
  data = "issue_6_bin",
  model_id = "M1",
  train_opts_id = "ex3",
  data_opts_id = "b_0_4",
  trainedmodelname = "ae_out",
  pheno_model_id = "p2"
) {
  gcaer::create_gcae_setup(
    datadir = datadir,
    data = data,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    trainedmodelname = trainedmodelname,
    pheno_model_id = pheno_model_id
  )
}
