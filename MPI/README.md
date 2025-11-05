
## Setup

Setup the example (need to be run only once)

```bash
./setup.sh
```

## Submitting the job

Run as:

```bash
sbatch --partition=debug --account=$SLURM_ACCOUNT job.sh
```

where you replace `$SLURM_ACCOUNT` by your account name or drop this parameter if this is not necessary for your cluster.
