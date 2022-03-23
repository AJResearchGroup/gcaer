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

echo "Show default help from '/opt/gcae'"
singularity run --cleanenv --bind $PWD/scripts/ gcaer.sif run_gcae.py --help

echo "Show help from local 'run_gcae.py'"
rm run_gcae.py
wget https://raw.githubusercontent.com/richelbilderbeek/GenoCAE/Pheno/run_gcae.py
sed -i 's/GenoCAE./This local version of GenoCAE./g' run_gcae.py
head run_gcae.py
singularity run --cleanenv --bind $PWD/scripts/ gcaer.sif run_gcae.py --help

