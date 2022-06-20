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

### Full experiment

Instead of using the multiple steps by `GenoCAE`,
`do_gcae_experiment` does all of these for you.

Here is an example of a full experiment: 

```
# Create the parameters for the experiment
gcae_experiment_params <- create_gcae_experiment_params(
  gcae_options = create_gcae_options(),
  gcae_setup = create_test_gcae_setup(
    model_id = "M0",
    superpops = get_gcaer_filename("gcae_input_files_1_labels.csv"),
    pheno_model_id = "p0"
  ),
  analyse_epochs = c(1, 2),
  metrics = "f1_score_3,f1_score_5"
)

# Do the experiment
gcae_experiment_results <- do_gcae_experiment(
  gcae_experiment_params = gcae_experiment_params
)

# Save the experiment's results
save_gcae_experiment_results(
  gcae_experiment_results = gcae_experiment_results,
  folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
)

# Create the plots for the experiment's results
create_plots_from_gcae_experiment_results(
  folder_name = gcae_experiment_params$gcae_setup$trainedmodeldir
)
```

### Workflow

To do the full GCAE workflow, a `gcae_setup` is needed,
from which the respective `gcae_[x]` functions are called,
where `[x]` matches the first GCAE CLI argument (for
example, use `gcaer`'s `gcae_train` to do the same as `run_gcae.py train`)

```
gcae_setup <- create_gcae_setup(
  datadir = file.path(get_gcae_folder(), "example_tiny/"),
  data = "issue_6_bin",
  model_id = "M1",
  pheno_model_id = "p2",
  superpops = file.path(datadir, "HO_superpopulations")
)

# 2. Train, approx 3 mins
train_filenames <- gcae_train(
  gcae_setup = gcae_setup,
  epochs = 3,
  save_interval = 1
)

# 3. Project
project_filenames <- gcae_project(
  gcae_setup = gcae_setup
)
project_results <- parse_project_files(project_filenames)

# 4. Evaluate
evaluate_filenames <- gcae_evaluate(
  gcae_setup,
  metrics = "f1_score_3,f1_score_5",
  epoch = 3
)

evaluate_results <- parse_evaluate_filenames(
  evaluate_filenames, 
  epoch = 3
)

```

## Links

 * [GCAE GitHub repository](https://github.com/richelbilderbeek/genocae/tree/Pheno)


