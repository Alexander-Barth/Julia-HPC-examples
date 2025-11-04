#!/bin/bash

# modules for Lucia (need to be adapted for other clusters)
module load EasyBuild/2024a OpenMPI/5.0.3-GCC-13.3.0

git clone https://github.com/eschnett/MPIwrapper
(cd MPIwrapper
git checkout v2.11.0

cmake -S . -B build -DMPIEXEC_EXECUTABLE=mpiexec -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=$HOME/mpiwrapper
cmake --build build
cmake --install build)

julia --project=. <<EOF
using Pkg;
Pkg.instantiate()
using MPIPreferences
MPIPreferences.use_jll_binary("MPItrampoline_jll")
EOF
