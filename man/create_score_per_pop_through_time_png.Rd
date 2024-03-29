% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_score_per_pop_through_time_png.R
\name{create_score_per_pop_through_time_png}
\alias{create_score_per_pop_through_time_png}
\title{Create a PNG file of the F1 scores per population through time}
\usage{
create_score_per_pop_through_time_png(score_per_pop_table, png_filename)
}
\arguments{
\item{score_per_pop_table}{table that contains the dimensionality
reduction scores per population}

\item{png_filename}{name of the \code{PNG} file to be produced,
as checked by \link{check_png_filename}}
}
\value{
a \link[ggplot2]{ggplot2}
}
\description{
Create a PNG file of the F1 scores per population through time
}
\author{
Richèl J.C. Bilderbeek
}
