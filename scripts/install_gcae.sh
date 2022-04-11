#!/bin/bash
#
# Installs multiple version of GCAE
# using the R code in the 'gcaer' package
#
# Because the R code in the package uses 'gcaer::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_gcae.sh
#
#
cat R/*.R > tempscript.R
echo "install_gcae()" >> tempscript.R
sed -i'.orginal' "s/gcaer:://g" tempscript.R
# cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
