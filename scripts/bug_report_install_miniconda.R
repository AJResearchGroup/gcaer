# miniconda_path <- file.path(tempfile(), "my_miniconda_path")
# reticulate::install_miniconda(path = miniconda_path)
# reticulate::use_miniconda(condaenv = miniconda_path)


miniconda_path <- file.path(tempfile(), "my_miniconda_path")

# Install Miniconda to my custom path
reticulate::install_miniconda(path = miniconda_path)

# Cool, cannot install Miniconda twice
testthat::expect_error(reticulate::install_miniconda(path = miniconda_path))

# Cool, my new Miniconda environment is there!
available_condas <- reticulate::conda_list()
testthat::expect_true("my_miniconda_path" %in% available_condas$name)

# Cannot activate it?? This is the error message:
#
# Error in reticulate::use_miniconda(condaenv = "my_miniconda_path") :
#  Miniconda is not installed.
# Use reticulate::install_miniconda() to install Miniconda.
reticulate::use_miniconda(condaenv = "my_miniconda_path")

# OK, maybe need the path to its Python binary
python_path <- available_condas["my_miniconda_path" == available_condas$name, ]$python

# Cannot activate it?? This is the error message:
#
# Error in reticulate::use_miniconda(condaenv = python_path) :
#   Miniconda is not installed.
# Use reticulate::install_miniconda() to install Miniconda.
reticulate::use_miniconda(condaenv = python_path)

# OK, maybe need the fokder of its Python binary
python_folder <- dirname(python_path)

# Cannot activate it?? This is the error message:
#
# Error in reticulate::use_miniconda(condaenv = python_folder) :
#   Miniconda is not installed.
# Use reticulate::install_miniconda() to install Miniconda.
reticulate::use_miniconda(condaenv = python_folder)

conda_paths <- stringr::str_subset(
  string = list.files(
    path = miniconda_path,
    full.names = TRUE,
    recursive = TRUE
  ),
  pattern = "/conda$"
)
for (conda_path in conda_paths) {
  message("conda_path: ", conda_path)
  t <- reticulate::conda_list(conda = conda_path)
  # message(paste(knitr::kable(t), collapse = " \n"))
  message(nrow(t))
}
conda_path <- conda_paths[1]
t <- reticulate::conda_list(conda = conda_path)
t
