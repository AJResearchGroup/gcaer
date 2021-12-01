#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @param args arguments for the \code{GCAE} executable
#' @param base_input_filename the base of the filenames that are
#' used as input for \code{GCAE}/\code{GCAE2}
#' @param base_output_filename the base of the filenames that are
#' used as output for \code{GCAE}/\code{GCAE2}
#' @param base_phenotype_value the base phenotypic value for an additive trait,
#' i.e. the phenotypic value for homozygotes of the common allele
#' @param data file prefix, not including path, of the data files.
#' The data files must be in EIGENSTRAT
#' or PLINK binary (`.bed`, `.bim`, `.fam`) format)
#' @param datadir directory where sample data is stored.
#' If not absolute: assumed relative to `GenoCAE/` directory.
#' A valid `datadir` ends with a slash (`/`)
#' and does not start with a full stop (`.`)
#' @param data_opts_id data options id,
#' corresponding to a file data_opts/data_opts_id.json
#' The data options affect how data is input to the model.
#' @param epochs number of epochs to train
#' @param example_filename name of the example file
#' @param gcae_exe_path path to
#'   the \code{GCAE} or \code{GCAE2} executable file.
#' @param gcae_folder folder where \code{GCAE} is installed
#' @param gcae_options options to run GCAE,
#' as created by \link{create_gcae_options}
#' @param gcae_setup GCAE model setup,
#' as created by \link{create_gcae_setup}
#' @param gcae_version version of GCAE, e.g. \code{"1.0"}
#' Use \link{get_gcae_version} to get the \code{GCAE} version.
#' @param gcaer_folder name of the folder where \link{gcaer}
#' stores its temporary files
#' @param genotype_concordances_filename path to the
#' `genotype_concordances.csv` file
#' @param github_repo_branch_name name of the `git` branch,
#' e.g `master` or `Pheno`.
#' Use \link{get_default_github_repo_branch_name} for the default value
#' @param github_repo_url URL of the GitHub repository,
#' e.g. `https://github.com/kausmees/GenoCAE`
#' or `https://github.com/cnettel/GenoCAE`
#' or `https://github.com/richelbilderbeek/GenoCAE`.
#' Use \link{get_default_github_repo_url} for the default value
#' @param log_filename name of a \code{GCAE} \code{.log} file
#' @param losses_from_project_filename path to the
#' `losses_from_project.csv` file
#' @param losses_from_train_t_filename path to the
#' `losses_from_train_t.csv` file
#' @param losses_from_train_v_filename path to the
#' `losses_from_train_v.csv` file
#' @param model_id model id, corresponding to a file models/model_id.json
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param out the base filename of the output files.
#' This parameter is named after the \code{GCAE}
#' \code{--out} flag
#' @param pheno_model_id phenotype model ID,
#' as checked by \link{check_pheno_model_id}
#' @param project_filenames path to the files
#' as created (and returned) by \link{gcae_project}
#' @param python_bin_path path to a `python` binary/executable
#' @param python_version the Python version
#' @param save_interval epoch intervals at which to save state of model,
#' and at which to calculate the valid loss
#' @param train_filenames path to the files
#' as created (and returned) by \link{gcae_train}
#' @param train_opts_id train options id, corresponding to a file
#' train_opts/train_opts_id.json
#' @param train_times_filename path to the `train_times.csv` file
#' @param trainedmodelname name of the trained model,
#'   which is `ae_out` by default
#' @param url \code{GCAE} download URL
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link[plinkr]{check_verbose} to detect if this argument is valid.
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  args,
  base_input_filename,
  base_output_filename,
  base_phenotype_value,
  data,
  datadir,
  data_opts_id,
  epochs,
  example_filename,
  gcae_exe_path,
  gcae_folder,
  gcae_options,
  gcae_setup,
  gcae_version,
  gcaer_folder,
  genotype_concordances_filename,
  github_repo_branch_name,
  github_repo_url,
  log_filename,
  losses_from_project_filename,
  losses_from_train_t_filename,
  losses_from_train_v_filename,
  model_id,
  os,
  out,
  pheno_model_id,
  project_filenames,
  python_bin_path,
  python_version,
  save_interval,
  train_filenames,
  train_opts_id,
  train_times_filename,
  trainedmodelname,
  url,
  verbose
) {
  # Nothing
}
