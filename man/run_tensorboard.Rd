% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_tensorboard.R
\name{run_tensorboard}
\alias{run_tensorboard}
\title{Run TensorBoard}
\usage{
run_tensorboard(logdir)
}
\arguments{
\item{logdir}{the directory that contains the TensorFlow log.
\code{logdir} is named after the TensorBoard \code{--logdir} CLI flag}
}
\description{
Run TensorBoard by starting a web server.
Never run this from RStudio, as this will cause a freeze
}
\author{
Richèl J.C. Bilderbeek
}
