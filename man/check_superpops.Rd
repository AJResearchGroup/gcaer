% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_superpops.R
\name{check_superpops}
\alias{check_superpops}
\title{Check if the \code{superpops} is valid}
\usage{
check_superpops(superpops)
}
\arguments{
\item{superpops}{path to the \code{superpops} file,
which contains the labels table and can be read
using \link{read_labels_file}.
This argument is named after the GCAE \code{--superpops} CLI flag.}
}
\value{
Nothing. Will \link{stop} if \code{superpops} is invalid.
}
\description{
Check if the \code{superpops} is valid.
Will \link{stop} if not.
}
\examples{
check_superpops("HumanOrigins249_tiny")
check_superpops("my_labels.csv")

# For those that do not care about the labels
check_superpops("")
}
\seealso{
to read the input \code{superpops} file, which
hold the labels table, use \link{read_labels_file}
}
\author{
Richèl J.C. Bilderbeek
}
