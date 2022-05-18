#' Check if all the files needed for \link{do_gcae_experiment}
#' are present.
#'
#' Check if all the files needed for \link{do_gcae_experiment}
#' are present.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' Will \link{stop} if any files needed for \link{do_gcae_experiment}
#' is absent.
#' @author Richèl J.C. Bilderbeek
#' @export
check_input_files_are_present <- function(gcae_experiment_params) {
  gcaer::check_gcae_experiment_params(gcae_experiment_params)

  model_filename <- gcaer::get_gcae_model_filename(
    model_id = gcae_experiment_params$gcae_setup$model_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  if (!file.exists(model_filename)) {
    stop(
      "Autoencoder architecture file absent. \n",
      "gcae_experiment_params$gcae_setup$model_id: ",
      gcae_experiment_params$gcae_setup$model_id, "\n",
      "model_filename: ", model_filename, " \n",
      "gcae_experiment_params$gcae_options$gcae_folder: ",
      gcae_experiment_params$gcae_options$gcae_folder, " \n",
      "Tip 1: maybe use a different 'model_id', ",
      "'model_id's available are {",
        paste0(
          gcaer::get_gcae_model_ids(gcae_options = gcae_experiment_params$gcae_options),
          collapse = ", "
        ), "} \n",
      "Tip 2: maybe use a different ",
      "'gcae_experiment_params$gcae_options$gcae_folder'"
    )
  }
  pheno_model_filename <- gcaer::get_gcae_pheno_model_filename(
    pheno_model_id = gcae_experiment_params$gcae_setup$pheno_model_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  if (!file.exists(pheno_model_filename)) {
    stop(
      "Phenotype prediction architecture file absent. \n",
      "gcae_experiment_params$gcae_setup$pheno_model_id: ",
      gcae_experiment_params$gcae_setup$pheno_model_id, "\n",
      "pheno_model_filename: ", pheno_model_filename, " \n",
      "gcae_experiment_params$gcae_options$gcae_folder: ",
      gcae_experiment_params$gcae_options$gcae_folder, " \n",
      "Tip 1: maybe use a different 'pheno_model_id', ",
      "'pheno_model_id's available are {",
      paste0(
        gcaer::get_gcae_pheno_model_ids(gcae_options = gcae_experiment_params$gcae_options),
        collapse = ", "
      ), "}\n",
      "Tip 2: maybe use a different ",
      "'gcae_experiment_params$gcae_options$gcae_folder'"
    )
  }

  train_opts_filename <- gcaer::get_gcae_train_opts_filename(
    train_opts_id = gcae_experiment_params$gcae_setup$train_opts_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  if (!file.exists(train_opts_filename)) {
    stop(
      "Training options file absent. \n",
      "gcae_experiment_params$gcae_setup$train_opts_id: ",
      gcae_experiment_params$gcae_setup$train_opts_id, "\n",
      "train_opts_filename: ", train_opts_filename, " \n",
      "gcae_experiment_params$gcae_options$gcae_folder: ",
      gcae_experiment_params$gcae_options$gcae_folder, " \n",
      "Tip 1: maybe use a different 'train_opts_id', ",
      "'train_opts_ids's available are {",
      paste0(
        gcaer::get_gcae_train_opts_ids(
          gcae_options = gcae_experiment_params$gcae_options
        ),
        collapse = ", "
      ), "}\n",
      "Tip 2: maybe use a different ",
      "'gcae_experiment_params$gcae_options$gcae_folder'"
    )
  }

  data_opts_filename <- gcaer::get_gcae_data_opts_filename(
    data_opts_id = gcae_experiment_params$gcae_setup$data_opts_id,
    gcae_options = gcae_experiment_params$gcae_options
  )
  if (!file.exists(data_opts_filename)) {
    stop(
      "Data storage options file absent. \n",
      "gcae_experiment_params$gcae_setup$data_opts_id: ",
      gcae_experiment_params$gcae_setup$data_opts_id, "\n",
      "data_opts_filename: ", data_opts_filename, " \n",
      "gcae_experiment_params$gcae_options$gcae_folder: ",
      gcae_experiment_params$gcae_options$gcae_folder, " \n",
      "Tip 1: maybe use a different 'data_opts_id', ",
      "'data_opts_ids's available are {",
      paste0(
        gcaer::get_gcae_data_opts_ids(
          gcae_options = gcae_experiment_params$gcae_options
        ),
        collapse = ", "
      ), "}\n",
      "Tip 2: maybe use a different ",
      "'gcae_experiment_params$gcae_options$gcae_folder'"
    )
  }
  invisible(gcae_experiment_params)
}
