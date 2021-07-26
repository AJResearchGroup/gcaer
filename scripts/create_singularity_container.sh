#!/bin/bash
#
# Create the Singularity container 'gcaer.sif'
#
# Usage:
#
#  ./scripts/create_singularity_container.sh
#
singularity build --fakeroot gcaer.sif Singularity
