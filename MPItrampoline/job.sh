#!/bin/bash
#SBATCH --job-name=test
#SBATCH --partition=debug
#SBATCH --time=00:15:00
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=700M
#SBATCH --output=slurm-%x-%j.out

# modules for Lucia (need to be adapted for other clusters)
module load EasyBuild/2024a OpenMPI/5.0.3-GCC-13.3.0

export MPITRAMPOLINE_MPIEXEC=$HOME/mpiwrapper/bin/mpiwrapper-mpiexec
export MPITRAMPOLINE_LIB=$HOME/mpiwrapper/lib64/libmpiwrapper.so

srun julia --project=. script.jl
