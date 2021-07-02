#' Create the GCAE setup
#'
#' Create the GCAE setup, which is:
#'  * `model` setup of the autoencoder
#'  * `train_options` setup of the training
#'  * `data_opts_id` setup of ?
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
create_gcae_setup <- function(
  model_id = "M1",
  train_opts_id = "ex3",
  data_opts_id = "b_0_4"
) {
  list(
    model_id = model_id,
    train_opts_id = train_opts_id,
    data_opts_id = data_opts_id
  )
}
