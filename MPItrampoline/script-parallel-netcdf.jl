using MPI
using NCDatasets

MPI.Init()

mpi_comm = MPI.COMM_WORLD
mpi_comm_size = MPI.Comm_size(mpi_comm)
mpi_rank = MPI.Comm_rank(mpi_comm)

# The file needs to be the same for all processes
filename = "file.nc"

# index based on MPI rank
i = mpi_rank + 1

# create the netCDF file
ds = NCDataset(mpi_comm,filename,"c")

# define the dimensions
defDim(ds,"lon",10)
defDim(ds,"lat",mpi_comm_size)
ncv = defVar(ds,"temp",Int32,("lon","lat"))

# enable colletive access (:independent is the default)
NCDatasets.paraccess(ds,:collective)

ncv[:,i] .= mpi_rank

ncv.attrib["units"] = "degree Celsius"
ds.attrib["comment"] = "MPI test"
close(ds)

if mpi_rank == 0
    println("NetCDF file $filename created using $mpi_comm_size MPI processes.")
    show(NCDataset(filename))
end
