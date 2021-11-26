#!/bin/bash
#
# Shows the 'gcaer::gcaer_report' without installing the gcaer package
#
# Because the R code in the package uses 'gcaer::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/gcaer_report.sh
#
#
cat R/*.R > tempscript.R
echo "gcaer_report()" >> tempscript.R
sed -i'.orginal' "s/gcaer:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
