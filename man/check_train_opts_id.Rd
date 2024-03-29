% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_train_opts_id.R
\name{check_train_opts_id}
\alias{check_train_opts_id}
\title{Check if the \code{train_opts_id} is valid}
\usage{
check_train_opts_id(train_opts_id)
}
\arguments{
\item{train_opts_id}{train options id, corresponding to a file
train_opts/train_opts_id.json}
}
\value{
Nothing. Will \link{stop} if \code{train_opts_id} is invalid.
}
\description{
Check if the \code{train_opts_id} is valid
Will \link{stop} if not.
}
\examples{
check_train_opts_id("ex3")
}
\author{
Richèl J.C. Bilderbeek
}
