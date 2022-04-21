#' Train model, and save its state at certain epochs to disk.
#'
#' Train model, and save its state at certain epochs to disk,
#' use the GCAE command-line interface.
#'
#' This will train the model from epoch zero. To resume training,
#' use \link{gcae_train_more}
#' @inheritParams default_params_doc
#' @return full paths to the created files
#' @seealso
#' Use \link{gcae_train_more} to continue training.
#' Use \link{create_gcae_train_args} to get the command-line
#' arguments.
#' @examples
#' if (plinkr::is_on_ci() && is_gcae_installed()) {
#'   gcae_options <- create_gcae_options()
#'   gcae_setup <- create_test_gcae_setup()
#'   train_filenames <- gcae_train(
#'     gcae_setup = gcae_setup,
#'     epochs = 1,
#'     save_interval = 1
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_train <- function(
  gcae_setup,
  epochs = 1,
  save_interval = 1,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  gcaer::check_epochs(epochs)
  testthat::expect_true(epochs >= 1)
  gcaer::check_save_interval(save_interval)
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)

  #- name: Train models with phenotype
  # run: python3 run_gcae.py train --datadir example_tiny --data issue_6_bin --model_id M1  --epochs 20 --save_interval 2  --train_opts_id ex3  --data_opts_id b_0_4 --pheno_model_id=p1 # nolint indeed a long line
  gcaer::check_gcae_train_files_are_present(
    gcae_setup = gcae_setup,
    gcae_options = gcae_options
  )

  args <- create_gcae_train_args(
    gcae_setup = gcae_setup,
    epochs = epochs,
    save_interval = save_interval
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
  ae_out_subfolder <- gcaer::get_gcae_output_subfolder(gcae_setup = gcae_setup)
  if (!dir.exists(ae_out_subfolder)) {
    stop(
      "'ae_out_subfolder' not found at path '", ae_out_subfolder, "' \n",
      paste0(gcaer::gcae_setup_to_str(gcae_setup), collapse = "\n"),
      paste0(gcaer::gcae_options_to_str(gcae_options), collapse = "\n"),
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
