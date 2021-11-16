envname <- "my_mc_env"
miniconda_path <- file.path(tempfile(), envname)

# conda_create() returns the path to the python binary of the created environment.
python_path <- reticulate::conda_create(envname = miniconda_path)
testthat::expect_true(file.exists(python_path))

reticulate::py_install()
reticulate::conda_python(envname = "my_miniconda_path")
python_path
