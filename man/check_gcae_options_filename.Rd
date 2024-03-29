% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_gcae_options_filename.R
\name{check_gcae_options_filename}
\alias{check_gcae_options_filename}
\title{Check if the \code{gcae_options_filename} is valid}
\usage{
check_gcae_options_filename(gcae_options_filename)
}
\arguments{
\item{gcae_options_filename}{name of a file to save/load a \code{gcae_options}
to/from}
}
\value{
Nothing. Will \link{stop} if \code{gcae_options_filename} is invalid.
}
\description{
Check if the \code{gcae_options_filename} is valid
Will \link{stop} if not.
}
\examples{
check_gcae_options_filename("gcae_options.csv")
}
\author{
Richèl J.C. Bilderbeek
}
