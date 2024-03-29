% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_trainedmodeldir.R
\name{check_trainedmodeldir}
\alias{check_trainedmodeldir}
\title{Check if the \code{trainedmodeldir} is valid}
\usage{
check_trainedmodeldir(trainedmodeldir)
}
\arguments{
\item{trainedmodeldir}{name of the folder to save the trained model to.
A valid \code{trainedmodeldir} ends with a slash (\code{/})
as to mimic the \code{GCAE} interface}
}
\value{
Nothing. Will \link{stop} if \code{trainedmodeldir} is invalid.
}
\description{
Check if the \code{trainedmodeldir} is valid
Will \link{stop} if not.
}
\examples{
check_trainedmodeldir("ae_out/")
}
\author{
Richèl J.C. Bilderbeek
}
