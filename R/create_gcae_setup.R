#' Create the GCAE setup
#'
#' Create the GCAE setup
#' @inheritParams default_params_doc
#' @return full paths to the created files
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
  list(
    datadir = datadir,
    data = datadir,
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id,
    trainedmodelname = trainedmodelname
  )
}
