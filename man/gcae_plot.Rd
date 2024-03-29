% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gcae_plot.R
\name{gcae_plot}
\alias{gcae_plot}
\title{Plot}
\usage{
gcae_plot(gcae_setup, gcae_options = create_gcae_options(), verbose = FALSE)
}
\arguments{
\item{gcae_setup}{GCAE model setup,
as created by \link{create_gcae_setup},
read from file by \link{read_gcae_setup_file},
checked by \link{check_gcae_setup},
and saved to file by \link{save_gcae_setup}.}

\item{gcae_options}{options to run GCAE,
as created by \link{create_gcae_options}}

\item{verbose}{the verbosity of a function.
Set to \link{TRUE} for more output.
Use \link[plinkr]{check_verbose} to detect if this argument is valid.}
}
\value{
full paths to the created files
}
\description{
Plot, using the GCAE command-line interface
}
\author{
Richèl J.C. Bilderbeek
}
