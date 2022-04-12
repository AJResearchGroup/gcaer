#!/bin/bash
#
# Installs the Python versions for GCAE
#
# Usage:
#
#  ./scripts/install_gcae_prerequisites.sh
#
#
apt-get update && apt-get upgrade -y
apt-get install -y wget python3-pip grep
python3 -m pip install --upgrade pip
# Tip from Pavlin Mitev, instead of 'python3 -m pip install --upgrade pip'
# python3 -m pip install --no-cache-dir --upgrade pip

wget https://raw.githubusercontent.com/richelbilderbeek/GenoCAE/Pheno/requirements.txt
python3 -m pip install -r requirements.txt
python3 -m pip list
