#' \link{gcaer}: An R interface to \code{GCAE}.
#'
#' \link{gcaer} is an R interface to \code{GCAE}.
#'
#' \link{gcaer} allows the user to install, run and uninstall
#' (multiple versions of) \code{GCAE}.
#' Also GCAE output files can be read, modified within R
#' and saved to GCAE-conforming files
#'
#' This is a list of functions to install or uninstall \code{GCAE}:
#'
#' * \link{check_gcae_is_installed}:
#'   check if \code{GCAE} is installed, stop if not
#' * \link{is_gcae_installed}:
#'   determine if \code{GCAE} is installed, yes/no
#' * \link{get_gcae_version}: get the version of \code{GCAE}
#' * \link{install_gcae}: install \code{GCAE}
#' * \link{uninstall_gcae}: uninstall \code{GCAE}
#'
#' This is a list of functions to run or with with \code{GCAE}:
#'
#' * \link{run_gcae}: run \code{GCAE}
#' * \link{gcae_train}: run \code{GCAE} \code{train}
#' * \link{project}: run \code{GCAE} \code{project}
#' * \link{gcae_plot}: run \code{GCAE} \code{plot}
#' * \link{gcae_animate}: run \code{GCAE} \code{animate}
#' * \link{gcae_evaluate}: run \code{GCAE} \code{evaluate}
#'
#' This is a list of functions to create simulated data for `GCAE`:
#'
#'  * \link{create_gcae_input_files_1}: create `GCAE` input files
#'    for a simple setting
#'
#' @examples
#' if (plinkr::is_on_ci()) {
#'   is_gcae_installed()
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name gcaer
NULL
