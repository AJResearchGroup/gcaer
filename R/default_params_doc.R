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
#' @param data file prefix, not including path, of the data files
#' (EIGENSTRAT of PLINK format)
#' @param datadir directory where sample data is stored
#' @param data_opts_id data options id,
#' corresponding to a file data_opts/data_opts_id.json
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
#' @param log_filename name of a \code{GCAE} \code{.log} file
#' @param model_id model id, corresponding to a file models/model_id.json
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param out the base filename of the output files.
#' This parameter is named after the \code{GCAE}
#' \code{--out} flag
#' @param save_interval epoch intervals at which to save state of model,
#' and at which to calculate the valid loss
#' @param train_opts_id train options id, corresponding to a file
#' train_opts/train_opts_id.json
#' @param url \code{GCAE} download URL
#' @param verbose the verbosity of a function.
#' Set to \link{TRUE} for more output.
#' Use \link{check_verbose} to detect if this argument is valid.
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
  log_filename,
  model_id,
  os,
  out,
  save_interval,
  train_opts_id,
  url,
  verbose
) {
  # Nothing
}
