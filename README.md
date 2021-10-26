# gcaer

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/gcaer/actions)|[![AppVeyor logo](man/figures/AppVeyor.png)](https://ci.appveyor.com/project/richelbilderbeek/gcaer/)                                                                                 |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/gcaer/workflows/R-CMD-check/badge.svg?branch=master)   |[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/richelbilderbeek/gcaer?branch=master&svg=true)](https://ci.appveyor.com/project/richelbilderbeek/gcaer) |[![codecov.io](https://codecov.io/github/richelbilderbeek/gcaer/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/gcaer/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/gcaer/workflows/R-CMD-check/badge.svg?branch=develop)  |[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/richelbilderbeek/gcaer?branch=develop&svg=true)](https://ci.appveyor.com/project/richelbilderbeek/gcaer)|[![codecov.io](https://codecov.io/github/richelbilderbeek/gcaer/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/gcaer/branch/develop)

Work with [GCAE](https://github.com/cnettel/genocae/tree/Pheno) from R.

 * [GCAE GitHub repository](https://github.com/cnettel/genocae/tree/Pheno)

## Installation

`gcaer` is not on CRAN yet. To install `gcaer`:

```
library(remotes)
install_github("richelbilderbeek/gcaer")
```

This assumes you have the `remotes` package installed.

## Install GCAE versions

To install GCAE all:

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

## Links

 * [GCAE GitHub repository](https://github.com/cnettel/genocae/tree/Pheno)

