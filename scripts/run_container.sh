#!/bin/bash
#
# Run the Singularity container on a demo R script
#
# Usage
#
# ./scripts/run_container.sh
#
# --cleanenv: recommened by tsnowlan at https://stackoverflow.com/a/71252619
# --bind $PWD/scripts/ : bind the folder, so that it works on GitHub Actions as well
singularity run --cleanenv --bind $PWD/scripts/ gcaer.sif scripts/demo_container.R

wget https://raw.githubusercontent.com/richelbilderbeek/GenoCAE/Pheno/run_gcae.py
singularity run gcaer.sif scripts/demo_container.R run_gcae.py

