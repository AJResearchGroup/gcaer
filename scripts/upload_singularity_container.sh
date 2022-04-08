#!/bin/bash
# Upload the Singularity container

singularity remote use SylabsCloud

# Log in, prevents error:
#
# FATAL:   Unable to push image to library: request did not succeed: Unauthorized (401 Unauthorized)
#
#
echo "To login, paste '~/.singularity/sylabs-token'"
echo 'Note that a token is valid for only 30 days, i.e. until february 14th 2022'
echo 'singularity remote login'

# Sign container
echo "To sign the container, paste your passphrase"
singularity sign gcaer.sif

# Upload the latest version
singularity push gcaer.sif library://richelbilderbeek/default/gcaer:0.6.6

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done uploading 'gcaer.sif'" "Done uploading 'gcaer.sif'"
fi
