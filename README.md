# gcaer

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/gcaer/actions)|[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/gcaer/workflows/R-CMD-check/badge.svg?branch=master)   |[![codecov.io](https://codecov.io/github/richelbilderbeek/gcaer/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/gcaer/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/gcaer/workflows/R-CMD-check/badge.svg?branch=develop)  |[![codecov.io](https://codecov.io/github/richelbilderbeek/gcaer/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/gcaer/branch/develop)

Work with [GCAE](https://github.com/richelbilderbeek/genocae/tree/Pheno) from R.

 * [GCAE GitHub repository](https://github.com/richelbilderbeek/genocae/tree/Pheno)

## Installation

`gcaer` is not on CRAN yet. To install `gcaer`:

```
library(remotes)
install_github("richelbilderbeek/gcaer")
```

This assumes you have the `remotes` package installed.

## Install GCAE versions

To install GCAE:

```
library(gcaer)
install_gcae()
```

## Examples

Get the GCAE help text:

```
library(gcaer)
get_gcae_help_text()
```

### Running GCAE

Run GCAE:

```
library(gcaer)
run_gcae("--help")
```

### Full workflow

All that needs to be supplied is:

 * `datadir`: the folder that holds PLINK1 binary files
 * `data`: the PLINK1 binary files basename
 * optional: `superpops`: a file with labeled data

```
datadir <- file.path(get_gcae_folder(), "example_tiny/")
data <- "issue_6_bin"
gcae_setup <- create_gcae_setup(
  datadir = datadir,
  data = data,
  model_id = "M1",
  pheno_model_id = "p2"
)
superpops <- clean_file_path(file.path(datadir, "HO_superpopulations"))

# 2. Train, approx 3 mins
train_filenames <- gcae_train(
  gcae_setup = gcae_setup,
  epochs = 1,
  save_interval = 1
)

# 3. Project
project_filenames <- gcae_project(
  superpops = superpops,
  gcae_setup = gcae_setup,
  verbose = TRUE
)
project_results <- parse_project_files(project_filenames)

# 4. Plot
plot_filenames <- gcae_plot(
  superpops = superpops,
  gcae_setup = gcae_setup,
  verbose = TRUE
)
plot_filenames
```

## Links

 * [GCAE GitHub repository](https://github.com/richelbilderbeek/genocae/tree/Pheno)


