
## Setup

Setup the example (need to be run only once), this will install `mpiwrapper` in your $HOME.

```bash
./setup.sh
```

See also the [installation instructions of MPItrampoline](https://github.com/eschnett/MPItrampoline) for more information.

Check the configured MPI library for MPI.jl

```bash
cat LocalPreferences.toml
```

It should mention `MPItrampoline_jll`.

Check the wrapped library:

```bash
ldd ~/mpiwrapper/lib64/libmpiwrapper.so
```

## Submitting the job

Run as:

```bash
sbatch --partition=debug --account=$SLURM_ACCOUNT job.sh script.jl
sbatch --partition=debug --account=$SLURM_ACCOUNT job.sh script-serial-netcdf.jl
sbatch --partition=debug --account=$SLURM_ACCOUNT job.sh script-parallel-netcdf.jl

```

where you replace `$SLURM_ACCOUNT` by your account name or drop this parameter if this is not necessary for your cluster and use the appropriate partition name.


