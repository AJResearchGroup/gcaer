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
create_gcae_setup <- function(
  datadir,
  data,
  superpops,
  model_id,
  train_opts_id,
  data_opts_id,
  pheno_model_id,
  trainedmodeldir = get_gcaer_tempfilename(pattern = "ae_out")
) {
  gcaer::check_datadir(datadir)
  gcaer::check_data(data)
  gcaer::check_superpops(superpops)
  gcaer::check_model_id(model_id)
  gcaer::check_train_opts_id(train_opts_id)
  gcaer::check_data_opts_id(data_opts_id)
  gcaer::check_pheno_model_id(pheno_model_id)
  gcaer::check_trainedmodeldir(trainedmodeldir)

  list(
    datadir = datadir,
    data = data,
    superpops = superpops,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    trainedmodeldir = trainedmodeldir,
    pheno_model_id = pheno_model_id
  )
}
