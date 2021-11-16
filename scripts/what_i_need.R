# What I need:
#
# * Install a Conda environment
# * Install Python packages
# * Run a Python script with that Conda environment and packages
#

folder_name <- tempfile()

# Initially, nothing is installed, this must be verified
is_conda_installed <- function(folder_name) {
  # ...
}

testthat::expect_false(is_conda_installed(folder_name = folder_name))

# Time to install Conda (or any other environment)
install_conda <- function(folder_name) {
  # ...
}
install_conda(folder_name = folder_name)
testthat::expect_true(is_conda_installed(folder_name = folder_name))

# Get a list of the installed Python packages
# (or more likely: a tibble)
get_installed_python_packages <- function(folder_name) {
  # ...
}
installed_python_packages <- get_installed_python_packages(folder_name = folder_name)

# Tensorflow (or any other absent package) will not be in that list yet
package_name <- "tensorflow"
testthat::expect_false(package_name %in% installed_python_packages) # Or something more elaborate, if installed_python_packages is a tibble

# Install it
install_python_packages <- function(folder_name, package_name) {
  # ...
}
install_python_packages(folder_name = folder_name, package_name = package_name)

testthat::expect_true(package_name %in% installed_python_packages) # Or something more elaborate, if installed_python_packages is a tibble


# Run a Python script with those packages with command-line arguments
run_python_script <- function(
  folder_name,
  python_script_path,
  args
) {
  # ...
}

output <- run_python_script(
  folder_name = folder_name,
  python_script_path = "run_gcae.py",
  args = "--help"
)

testthat::expect_true(length(output) > 0)
