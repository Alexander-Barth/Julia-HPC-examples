#!/bin/bash
#SBATCH --job-name=test
#SBATCH --time=00:15:00
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=700M
#SBATCH --output=slurm-%x-%j.out

if module avail EasyBuild/2024a 2>&1 | grep -q EasyBuild/2024a; then
    # modules for Lucia
    module load EasyBuild/2024a OpenMPI/5.0.3-GCC-13.3.0
elif module avail Local-CSC 2>&1 | grep -q Local-CSC; then
    # modules for LUMI
    module load Local-CSC julia-mpi
#elif
    # Load modules for other clusters
fi

srun julia --project=. "$@"
