#!/bin/bash

if module avail EasyBuild/2024a 2>&1 | grep -q EasyBuild/2024a; then
    # modules for Lucia
    module load EasyBuild/2024a OpenMPI/5.0.3-GCC-13.3.0
elif module avail Local-CSC 2>&1 | grep -q Local-CSC; then
    # modules for LUMI
    module load Local-CSC julia-mpi
#elif
    # Load modules for other clusters
fi

julia --project=. <<EOF
using Pkg;
Pkg.instantiate()
using MPIPreferences
MPIPreferences.use_system_binary()
EOF
