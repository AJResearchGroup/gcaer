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
#' @param bed_filename name of a PLINK genotypes (`.bed`) file,
#' as can be read using \link[plinkr]{read_plink_bed_file}
#' @param bim_filename name of a PLINK `.bim` file
#' as can be read using \link[plinkr]{read_plink_bim_file}
#' @param csv_filename name of the comma-seperated (`.csv`) file to be produced,
#' as checked by \link{check_csv_filename}
#' @param csv_filename_for_nmse name for the comma-seperated file
#' (as checked by \link{check_csv_filename})
#' to store the normalized mean square error compared to the identity line
#' @param data file prefix, not including path, of the data files.
#' The data files must be in EIGENSTRAT
#' or PLINK binary (`.bed`, `.bim`, `.fam`) format)
#' @param datadir directory where sample data is stored.
#' If not absolute: assumed relative to `GenoCAE/` directory.
#' A valid `datadir` ends with a slash (`/`)
#' and does not start with a full stop (`.`),
#' as to mimic the `GCAE` interface
#' @param data_opts_id data options id,
#' corresponding to a file data_opts/data_opts_id.json
#' The data options affect how data is input to the model.
#' @param epoch the epoch, as checked by \link{check_epoch}
#' @param epochs number of epochs, as checked by \link{check_epochs}
#' @param example_filename name of the example file
#' @param fam_filename name of a PLINK `.fam` file
#' as can be read using \link[plinkr]{read_plink_fam_file}
#' @param gcae_folder folder where \code{GCAE} is installed
#' @param gcae_input_data in-memory data that can be used
#' as input for `GCAE`. Use link{read_gcae_input_files}
#' to read it from files, use \link{check_gcae_input_data}
#' to check it for validity.
#' @param gcae_input_filenames the GCAE input filenames,
#' in the form of a \link{list} with the following elements:
#'   * `bed_filename`: path to a `.bed` file,
#'     as can be read by \link[plinkr]{read_plink_bed_file}
#'   * `bim_filename`: path to a `.bim` file,
#'     as can be read by \link[plinkr]{read_plink_bim_file}
#'   * `fam_filename`: path to a `.fam` file,
#'     as can be read by \link[plinkr]{read_plink_fam_file}
#'   * `phe_filename`: path to a `.phe` file,
#'     as can be read by \link[plinkr]{read_plink_phe_file}
#'   * `labels_filename`: path to a `.csv` file
#'     as can be read by \link{read_labels_file}
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
#' @param labels_filename path to a `.csv` file containing super-
#' and -population labels, as can be read by \link{read_labels_file}
#' @param labels_table a table containing super-
#' and -population labels, as can be read by \link{read_labels_file}.
#' Note that `GCAE` does not use column names, `gcaer` adds these
#' for convenience
#' @param log_filename name of a \code{GCAE} \code{.log} file
#' @param losses_from_project_filename path to the
#' `losses_from_project.csv` file
#' @param losses_from_train_t_filename path to the
#' `losses_from_train_t.csv` file
#' @param losses_from_train_v_filename path to the
#' `losses_from_train_v.csv` file
#' @param metric the metric, as checked by \link{check_metric}
#' @param metrics the metrics, as checked by \link{check_metrics}
#' @param model the `GCAE` architecture,
#' as checked by \link{check_model}.
#' Use \link{read_model_file} to read a `GCAE` architecture from file.
#' Use \link{save_model} to save the `model` to a JSON file.
#' Use \link{plot_model} to plot the `model`.
#' Use \link{save_model_plot} to save a plot of the `model` to file.
#' @param model_filename name of a file that stores a `GCAE` architecture,
#' as checked by \link{check_model_filename}.
#' Use \link{read_model_file} to read a `GCAE` architecture from that file.
#' @param model_id model id, corresponding to a file models/model_id.json
#' @param n_neurons the number of neurons,
#' as checked by \link{check_n_neurons}
#' @param ormr_folder_name folder where the link[ormr]{ormr} R package
#' installs the Python packages
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param out the base filename of the output files.
#' This parameter is named after the \code{GCAE}
#' \code{--out} flag
#' @param phe_filename name of a PLINK phenotype (`.phe`) file
#' as can be read using \link[plinkr]{read_plink_phe_file}
#' @param pheno_model_id phenotype model ID,
#' as checked by \link{check_pheno_model_id}
#' @param plink_options PLINK options,
#' as created by \link[plinkr]{create_plink_options}
#' @param png_filename name of the `PNG` file to be produced,
#' as checked by \link{check_png_filename}
#' @param project_filenames path to the files
#' as created (and returned) by \link{gcae_project}
#' @param python_bin_path path to a `python` binary/executable
#' @param python_version the Python version
#' @param save_interval epoch intervals at which to save state of model,
#' and at which to calculate the valid loss
#' @param superpops path to the `superpops` file,
#' which contains the labels table and can be read
#' using \link{read_labels_file}.
#' This argument is named after the GCAE `--superpops` CLI flag.
#' @param train_filenames path to the files
#' as created (and returned) by \link{gcae_train}
#' @param train_opts_id train options id, corresponding to a file
#' train_opts/train_opts_id.json
#' @param train_times_filename path to the `train_times.csv` file
#' @param trainedmodeldir name of the folder to save the trained model to.
#' A valid `trainedmodeldir` ends with a slash (`/`)
#' as to mimic the `GCAE` interface
#' @param trainedmodelname name of the trained model,
#'   which is `ae_out` by default
#' @param unique_id the unique identifier of a setting
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
  bed_filename,
  bim_filename,
  csv_filename,
  csv_filename_for_nmse,
  data,
  datadir,
  data_opts_id,
  epoch,
  epochs,
  example_filename,
  fam_filename,
  gcae_folder,
  gcae_input_data,
  gcae_input_filenames,
  gcae_options,
  gcae_setup,
  gcae_version,
  gcaer_folder,
  genotype_concordances_filename,
  github_repo_branch_name,
  github_repo_url,
  labels_filename,
  labels_table,
  log_filename,
  losses_from_project_filename,
  losses_from_train_t_filename,
  losses_from_train_v_filename,
  metric,
  metrics,
  model,
  model_filename,
  model_id,
  n_neurons,
  ormr_folder_name,
  os,
  out,
  phe_filename,
  plink_options,
  pheno_model_id,
  png_filename,
  project_filenames,
  python_bin_path,
  python_version,
  save_interval,
  superpops,
  train_filenames,
  train_opts_id,
  train_times_filename,
  trainedmodeldir,
  trainedmodelname,
  unique_id,
  url,
  verbose
) {
  # Nothing
}
