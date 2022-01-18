#' Train model, and save its state at certain epochs to disk.
#'
#' Train model, and save its state at certain epochs to disk,
#' use the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_train <- function(
  gcae_setup = create_gcae_setup(),
  epochs = 1,
  save_interval = 1,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_epochs(epochs)
  gcaer::check_save_interval(save_interval)
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)

  #- name: Train models with phenotype
  # run: python3 run_gcae.py train --datadir example_tiny --data issue_6_bin --model_id M1  --epochs 20 --save_interval 2  --train_opts_id ex3  --data_opts_id b_0_4 --pheno_model_id=p1
  gcaer::check_gcae_train_files_are_present(gcae_setup = gcae_setup)

  args <- c(
    "train",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--epochs", epochs,
    "--save_interval", save_interval,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    paste0("--pheno_model_id=", gcae_setup$pheno_model_id)
  )
  if (verbose) {
    message(
      "Running GCAE with arguments: '", paste0(args, collapse = " "), " \n",
      "Tip: you should be able to copy-paste this :-)"
    )
  }
  output <- gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  if (verbose) {
    message("GCAE output: \n", paste0(output, collapse = "\n"))
  }
  ae_out_subfolder <- get_gcae_output_subfolder(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )
  if (!dir.exists(ae_out_subfolder)) {
    stop(
      "'ae_out_subfolder' not found at path '", ae_out_subfolder, "' \n",
      paste0(gcae_options_to_str(gcae_options), collapse = "\n"),
      "'args': '", paste0(args, collapse = " "), "' \n",
      "Tip: you should be able to copy-paste the args :-)"
    )
  }
  testthat::expect_true(dir.exists(ae_out_subfolder))
  train_filenames <- list.files(
    path = ae_out_subfolder,
    full.names = TRUE,
    recursive = TRUE
  )
  train_filenames
}
