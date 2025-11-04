#!/bin/bash

# modules for Lucia (need to be adapted for other clusters)
module load EasyBuild/2024a OpenMPI/5.0.3-GCC-13.3.0

julia --project=. <<EOF
using Pkg;
Pkg.instantiate()
using MPIPreferences
MPIPreferences.use_system_binary()
EOF
