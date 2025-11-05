using MPI
using NCDatasets
MPI.Init()
comm = MPI.COMM_WORLD
rank = MPI.Comm_rank(comm)
println("Hello world, I am $rank of $(MPI.Comm_size(comm))")
MPI.Barrier(comm)

# independent netCDF IO
ds = NCDataset("test-file-rank$rank.nc","c")
defVar(ds,"rank",fill(rank,(2,3)),("lon","lat"))
close(ds)


