% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_gcaer_tempfilename.R
\name{get_gcaer_tempfilename}
\alias{get_gcaer_tempfilename}
\title{Get a temporary filename}
\usage{
get_gcaer_tempfilename(pattern = "file", fileext = "")
}
\arguments{
\item{pattern}{a non-empty character vector
giving the initial part of the name.}

\item{fileext}{a non-empty character vector
giving the file extension}
}
\value{
name for a temporary file
}
\description{
Get a temporary filename, similar to \link{tempfile},
except that it always writes to a temporary folder
named \link{gcaer}.
}
\note{
this function is added to make sure no temporary
cache files are left undeleted
}
\examples{
get_gcaer_tempfilename()
get_gcaer_tempfilename(pattern = "my_file")
get_gcaer_tempfilename(fileext = ".txt")
}
\author{
Richèl J.C. Bilderbeek
}
