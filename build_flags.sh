#!/bin/bash

export ENVIRONMENT="$(hostname | awk -F '[.-]' '{print $1}' | sed 's/[0-9]//g')"

# Environment-dependent flags and libraries
if [[ "$ENVIRONMENT" == "tigergpu" ]]; then
  export TF_NEED_MPI=1
  export MPI_HOME="/home/andrewor/lib/openmpi"
elif [[ "$ENVIRONMENT" == "visiongpu" ]]; then
  export TF_NEED_MPI=0
elif [[ "$ENVIRONMENT" == "ns" ]]; then
  export TF_NEED_MPI=1
  export MPI_HOME="/home/andrewor/lib/openmpi"
elif [[ "$ENVIRONMENT" == "snsgpu" ]]; then
  export TF_NEED_MPI=0
else
  echo "ERROR: Unknown environment '$ENVIRONMENT'"
  exit 1
fi

