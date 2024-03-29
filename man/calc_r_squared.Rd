% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_r_squared.R
\name{calc_r_squared}
\alias{calc_r_squared}
\title{Calculate the \code{r_squared}}
\usage{
calc_r_squared(true_values, estimated_values)
}
\arguments{
\item{true_values}{the true values}

\item{estimated_values}{the estimated values}
}
\value{
the mean squared error from the identity line
}
\description{
Calculate the \code{r_squared}
}
\examples{
true_values_degrees <- seq(1, 360)
estimated_values_degrees <- true_values_degrees + stats::runif(n = 360)
r_squared_degrees <- calc_r_squared(
  true_values = true_values_degrees,
  estimated_values = estimated_values_degrees
)
r_squared_degrees

# Convert degrees to radians
true_values_radians <- 2.0 * pi * true_values_degrees / 360
estimated_values_radians <- 2.0 * pi * estimated_values_degrees / 360
r_squared_radians <- calc_r_squared(
  true_values = true_values_radians,
  estimated_values = estimated_values_radians
)
r_squared_radians

# mse_degrees and mse_radians are the same, due to their normalized scales
}
\author{
Richèl J.C. Bilderbeek
}
