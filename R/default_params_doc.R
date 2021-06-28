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
#' @param confidence_interval confidence interval, a value between (and
#' excluding both) 0.0 and 1.0. The confidence interval helps assess
#' the certainty of an estimation: you can be 99 percent sure
#' a value is within the range of the 0.99 confidence interval
#' @param data file prefix, not including path, of the data files
#' (EIGENSTRAT of PLINK format)
#' @param datadir directory where sample data is stored
#' @param data_opts_id data options id,
#' corresponding to a file data_opts/data_opts_id.json
#' @param epistatic_phenotype_value the phenotypic value when the
#' epistatic phenotype is expressed
#' @param epochs number of epochs to train
#' @param example_filename name of the example file
#' @param gcae_exe_path path to
#'   the \code{GCAE} or \code{GCAE2} executable file.
#' @param gcae_folder folder where \code{GCAE} is installed
#' @param gcae_options options to run GCAE,
#' as created by \link{create_gcae_options}
#' @param gcae_version version of GCAE, e.g. \code{"1.0"}
#' Use \link{get_gcae_version} to get the \code{GCAE} version.
#' @param gcaer_folder name of the folder where \link{gcaer}
#' stores its temporary files
#' @param log_filename name of a \code{GCAE} \code{.log} file
#' @param maf minor allele frequency threshold.
#' Alleles that have a frequency lower than the MAF
#' are excluded from the \code{GCAE} analysis.
#' \code{maf} must be a value between zero and 0.5
#' (i.e. excluding zero and excluding 0.5).
#' By default, \code{maf} is set to the lowest
#' representable non-zero floating-point value,
#' @param map_table a genetic mapping table.
#'
#' A \code{map_table} is a \link[tibble]{tibble} with the following columns:
#'  * \code{CHR}: the chromosome code or contig name.
#'    The chromosome number cannot exceed 95
#'    (\url{https://www.cog-genomics.org/gcae/1.9/input#chr_set})
#'  * \code{SNP}: Variant identifier
#'  * \code{position_cm}: Position in morgans or centimorgans.
#'      This value is optional. Zeroes denote it is unused
#'  * \code{BP}: Base-pair coordinat
#' @param model_id model id, corresponding to a file models/model_id.json
#' @param os name of the operating system,
#' as returned by \link[rappdirs]{app_dir}
#' @param out the base filename of the output files.
#' This parameter is named after the \code{GCAE}
#' \code{--out} flag
#' @param ped_table a 'pedigree' table.
#'
#' A \code{ped_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
#'   * \code{within_family_id_father} Within-family ID of father
#'       (\code{0} if father isn't in dataset)
#'   * \code{within_family_id_mother} Within-family ID of mother
#'       (\code{0} if mother isn't in dataset)
#'   * \code{sex_code} Sex code
#'       (\code{1} = male, \code{2} = female, \code{0} = unknown)
#'   * \code{case_control_code} Case control code
#'       (\code{1} = control, \code{2} = case,
#'       \code{9}/\code{0}/non-numeric = missing data if case/control)
#'   * \code{snv_[x][y]} Nucleotide for the \code{x}th variant
#'     for haplotype \code{y} (\code{y} is either \code{a} or \code{b})
#'     in the \code{.map file} (\code{0} = no call)
#'
#' The \code{FID} and \code{IID} column names match the GCAE names, see
#' \url{https://www.cog-genomics.org/gcae/1.9/input#pheno}.
#'
#' @param phe_table a table of phenotypes.
#'
#' A \code{phe_table} is a \link[tibble]{tibble} with these columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID
#'       (cannot be zero)
#'   * One or more columns of phenotype values,
#'     columns can have any name
#'
#' Thes names match the GCAE column
#' names (\url{https://www.cog-genomics.org/gcae/1.9/input#pheno}).
#' @param trait one trait with a clear genetic architecture and a known
#' minor allele frequency, as created by \link{create_trait}.
#' Use \link{is_one_trait} to detect if something is one trait
#' @param save_interval epoch intervals at which to save state of model,
#' and at which to calculate the valid loss
#' @param train_opts_id train options id, corresponding to a file
#' train_opts/train_opts_id.json
#' @param traits one or more traits
#' with a clear genetic architecture and a known minor allele frequency,
#' as, for example, created by \link{create_demo_traits}.
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
  confidence_interval,
  data,
  datadir,
  data_opts_id,
  epistatic_phenotype_value,
  epochs,
  example_filename,
  gcae_exe_path,
  gcae_folder,
  gcae_options,
  gcae_version,
  gcaer_folder,
  log_filename,
  maf,
  map_table,
  model_id,
  os,
  out,
  ped_table,
  phe_table,
  save_interval,
  train_opts_id,
  trait,
  traits,
  url,
  verbose
) {
  # Nothing
}
