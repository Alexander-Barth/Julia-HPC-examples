
## Setup

Setup the example (need to be run only once)

```bash
./setup.sh
```

## Submitting the job

Run as:

```bash
sbatch --partition=debug --account=$SLURM_ACCOUNT job.sh script.jl
```

where you replace `$SLURM_ACCOUNT` by your account name or drop this parameter if this is not necessary for your cluster.



## Troubeshooting

Using MPI with arrays on the GPU fails with (LUMI):

```
[123441] signal 11 (1): Segmentation fault
in expression starting at /users/barthale/src/Julia-HPC-examples/MPI/script.jl:2
MPICH ERROR [Rank 0] [job id 14833080.5] [Fri Nov 21 09:21:34 2025] [nid007972] - Abort(-1) (rank 0 in comm 0): MPIDI_CRAY_init: GPU_SUPPORT_ENABLED is requested, but GTL library is not linked
 (Other MPI error)

aborting job:
MPIDI_CRAY_init: GPU_SUPPORT_ENABLED is requested, but GTL library is not linked
```

Use the following `LocalPreferences.toml`:

```toml
[MPIPreferences]
__clear__ = ["preloads"]
_format = "1.1"
abi = "MPICH"
binary = "system"
cclibs = ["sci_cray_mpi", "sci_cray", "dl", "dsmml", "xpmem", "stdc++", "pgas-shmem", "quadmath", "modules", "fi", "craymath", "f", "u", "csup"]
libmpi = "libmpi_cray.so"
mpiexec = "srun"
preloads = ["libmpi_gtl_hsa.so"]
preloads_env_switch = "MPICH_GPU_SUPPORT_ENABLED"
```