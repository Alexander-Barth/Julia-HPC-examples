
## Setup

Setup the example (need to be run only once), this will install `mpiwrapper` in your $HOME.

```bash
./setup.sh
```

Check the wrapped library:

```bash
ldd ~/mpiwrapper/lib64/libmpiwrapper.so
```

## Submitting the job

Run as:

```bash
sbatch --account=$SLURM_ACCOUNT job.sh script.jl
```

where you replace `$SLURM_ACCOUNT` by your account name or drop this parameter if this is not necessary for your cluster.


