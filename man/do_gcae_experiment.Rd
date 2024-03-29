% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/do_gcae_experiment.R
\name{do_gcae_experiment}
\alias{do_gcae_experiment}
\title{Do a full \code{GCAE} experiment}
\usage{
do_gcae_experiment(gcae_experiment_params)
}
\arguments{
\item{gcae_experiment_params}{parameters to run a full
\code{GCAE} experimenr (i.e. call \link{do_gcae_experiment}),
as created by \link{create_gcae_experiment_params} and checked
by \link{check_gcae_experiment_params}}
}
\value{
a \code{gcae_experiment_results}
}
\description{
Do a full \code{GCAE} experiment
}
\note{
instead of using \code{verbose} as a function argument,
\code{verbose} is part of the \code{gcae_experiment_params}, so
that \code{verbosity} can be turned on/off by editing a
parameters file
}
\author{
Richèl J.C. Bilderbeek
}
