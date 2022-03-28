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

echo "Demo the container"
singularity run --cleanenv --bind $PWD/scripts/ gcaer.sif scripts/demo_container.R

echo "Show default help from '/opt/gcae'"
singularity run --cleanenv --bind $PWD/scripts/ gcaer.sif --help

echo "Show help from local 'run_gcae.py'"
echo "Download 'run_gcae.py'"
wget https://raw.githubusercontent.com/richelbilderbeek/GenoCAE/Pheno/run_gcae.py

echo "Show the head of the downloaded 'run_gcae.py':"
head run_gcae.py

echo "Get the help using the downloaded 'run_gcae.py':"
singularity run --cleanenv gcaer.sif run_gcae.py --help

