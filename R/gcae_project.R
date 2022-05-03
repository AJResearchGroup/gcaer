#' Project
#'
#' Project, using the GCAE command-line interface
#' @inheritParams default_params_doc
#' @return full paths to the created files. These are:
#'  * `losses_from_project.csv` and `losses_from_project.pdf`
#'    show the loss function value of the model per epoch.
#'    Note that this is the loss for the entire data set.
#'  * `genotype_concordances.csv` and `genotype_concordances.pdf`
#'    the genotype concordances of the model per epoch
#'    (this is the rate that the model output is equal to the model input).
#'    the black line shows the baseline genotype concordance,
#'    given by guessing the most frequently occurring genotype per marker.
#'  * A file called `encoded_data.h5` containing the projected data
#'    (= the encoded data) for all samples at each epoch.
#'    This file is used by the plot, evaluate and animate commands.
#'  * for each saved epoch: a plot of the projected samples colored
#'    according to population, and if specified, superpopulation.
#'    A legend is written to a separate file.
#'  * A plot `true_genotypes.pdf` showing a histogram of the true (input)
#'    genotypes that the model is trained on
#'  * A plot output_as_genotypes.pdf showing a histogram of the model output
#'    interpreted as genotypes, for the last epoch
#' @author Richèl J.C. Bilderbeek
#' @export
gcae_project <- function(
  gcae_setup,
  gcae_options = create_gcae_options(),
  verbose = FALSE
) {
  gcaer::check_gcae_setup(gcae_setup)
  if (gcae_setup$superpops != "") {
    testthat::expect_true(file.exists(gcae_setup$superpops))
  }
  gcaer::check_gcae_options(gcae_options)
  plinkr::check_verbose(verbose)
  args <- c(
    "project",
    "--datadir", gcae_setup$datadir,
    "--data", gcae_setup$data,
    "--model_id", gcae_setup$model_id,
    "--train_opts_id", gcae_setup$train_opts_id,
    "--data_opts_id", gcae_setup$data_opts_id,
    "--trainedmodeldir", gcae_setup$trainedmodeldir,
    "--pheno_model_id", gcae_setup$pheno_model_id
  )
  if (gcae_setup$superpops != "") {
    args <- c(args, "--superpops", gcae_setup$superpops)
  }
  gcaer::run_gcae(
    args = args,
    gcae_options = gcae_options,
    verbose = verbose
  )
  gcae_output_subfolder <- gcaer::get_gcae_output_subfolder(
    gcae_setup = gcae_setup
  )
  testthat::expect_true(dir.exists(gcae_output_subfolder))
  gcae_plot_subfolder <- file.path(gcae_output_subfolder, gcae_setup$data)
  testthat::expect_true(dir.exists(gcae_plot_subfolder))

  project_filenames <- list.files(
    gcae_plot_subfolder,
    full.names = TRUE,
    recursive = TRUE,
    pattern = ".*\\.csv$"
  )
  project_filenames
}
