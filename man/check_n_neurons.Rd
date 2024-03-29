% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_n_neurons.R
\name{check_n_neurons}
\alias{check_n_neurons}
\title{Check if the \code{n_neurons} is valid}
\usage{
check_n_neurons(n_neurons)
}
\arguments{
\item{n_neurons}{the number of neurons,
as checked by \link{check_n_neurons}}
}
\value{
Nothing. Will \link{stop} if \code{n_neurons} is invalid.
}
\description{
Check if the \code{n_neurons} is valid
Will \link{stop} if not.
}
\examples{
check_n_neurons(0)
check_n_neurons(1)
check_n_neurons(100)
}
\author{
Richèl J.C. Bilderbeek
}
