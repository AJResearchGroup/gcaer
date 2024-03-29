% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_n_neurons_in_latent_layer.R
\name{set_n_neurons_in_latent_layer}
\alias{set_n_neurons_in_latent_layer}
\title{Set the number of neurons in the latent layer}
\usage{
set_n_neurons_in_latent_layer(model, n_neurons)
}
\arguments{
\item{model}{the \code{GCAE} architecture,
as checked by \link{check_model}.
Use \link{read_model_file} to read a \code{GCAE} architecture from file.
Use \link{save_model} to save the \code{model} to a JSON file.
Use \link{plot_model} to plot the \code{model}.
Use \link{save_model_plot} to save a plot of the \code{model} to file.}

\item{n_neurons}{the number of neurons,
as checked by \link{check_n_neurons}}
}
\value{
the model with the desired number of neurons in the latent layer
}
\description{
Set the number of neurons in the latent layer
}
\examples{
if (is_gcae_repo_cloned()) {
  # A real GCAE file
  model_filename <- get_gcae_model_filename("M1")
} else {
  # An example file
  model_filename <- get_gcaer_filename("M0.json")
}
model <- read_model_file(model_filename)
new_model <- set_n_neurons_in_latent_layer(
  model = model,
  n_neurons = 1
)
get_n_neurons_in_latent_layer(new_model)
}
\author{
Richèl J.C. Bilderbeek
}
