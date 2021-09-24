#' Create the GCAE setup
#'
#' Create the GCAE setup
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @examples
#' create_gcae_setup(
#'   datadir = "my_datadir/",
#'   data = "HumanOrigins249_tiny"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_setup <- function(
  datadir,
  data,
  model_id = "M1",
  train_opts_id = "ex3",
  data_opts_id = "b_0_4",
  trainedmodelname = "ae_out"
) {
  gcaer::check_datadir(datadir)
  gcaer::check_data(data)
  gcaer::check_model_id(model_id)
  gcaer::check_train_opts_id(train_opts_id)
  gcaer::check_data_opts_id(data_opts_id)
  gcaer::check_trainedmodelname(trainedmodelname)
  list(
    datadir = datadir,
    data = data,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    trainedmodelname = trainedmodelname
  )
}
