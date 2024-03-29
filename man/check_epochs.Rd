% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_epochs.R
\name{check_epochs}
\alias{check_epochs}
\title{Check if the \code{epochs} is valid}
\usage{
check_epochs(epochs)
}
\arguments{
\item{epochs}{number of epochs, as checked by \link{check_epochs}}
}
\value{
Nothing. Will \link{stop} if \code{epochs} is invalid.
}
\description{
Check if the \code{epochs} is valid
Will \link{stop} if not.
}
\details{
Note that in some contexts, \code{epochs} cannot be zero.
That condition will be checked in that context.
}
\examples{
check_epochs(0)
check_epochs(1)
check_epochs(100)
}
\author{
Richèl J.C. Bilderbeek
}
