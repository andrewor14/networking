#!/bin/bash

source build_flags.sh

./configure

echo "Done configuring. Now running bazel build."

time bazel build -c opt //tensorflow_networking/mpi:mpi_server_lib

