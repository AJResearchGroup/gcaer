# installation

## How to install gcaer?


```
library(remotes)
install_github("richelbilderbeek/gcaer")
```

## How to install GCAE?

```
library(gcaer)
install_gcae()
```

## What does `gcaer::install_gcae` install?

What                         |How                        |Check
-----------------------------|---------------------------|-----------------------------------
Install the GCAE repository  |`clone_gcae_repo`          |`has_cloned_gcae_repo`
Install the GCAE requirements|`install_gcae_requirements`|`has_gcae_requirements_installed`

## What does `gcaer::install_gcae_requirements` install?

What                         |How                           |Check
-----------------------------|------------------------------|------------------------------------
Install Miniconda            |`install_miniconda`           |`is_miniconda_installed`
Install pip                  |`install_pip`                 |`is_pip_installed`
Install GCAE Python packages |`install_gcae_python_packages`|`are_gcae_python_packages_installed`

