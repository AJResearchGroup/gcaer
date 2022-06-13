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
  datadir = get_test_datadir(),
  data = get_test_data(),
  superpops = gcaer::get_gcaer_filename("gcae_input_files_1_labels.csv"),
  model_id = "M0",
  train_opts_id = "ex3",
  data_opts_id = "b_0_4",
  pheno_model_id = "p0",
  trainedmodeldir = paste0(get_gcaer_tempfilename(pattern = "ae_out"), "/")
) {
  gcaer::create_gcae_setup(
    datadir = datadir,
    data = data,
    superpops = superpops,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    pheno_model_id = pheno_model_id,
    trainedmodeldir = trainedmodeldir
  )
}
