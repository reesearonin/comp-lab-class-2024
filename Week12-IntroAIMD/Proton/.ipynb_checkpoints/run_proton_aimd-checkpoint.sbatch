#!/bin/bash
#SBATCH --job-name=water_aimd       # Job name
#SBATCH --nodes=1                   # Number of nodes
#SBATCH --ntasks-per-node=12        # Number of tasks per node
#SBATCH --cpus-per-task=1           # 1 CPU per task
#SBATCH --mem=20GB                  # Memory per node
#SBATCH --time=24:00:00             # Walltime (6 hours)
#SBATCH --output=proton_aimd_%j.log  # Standard output and error (%j is replaced by job ID)

# Load necessary modules
module load cp2k/openmpi/intel/20201212

# Change to the directory where the input files are located
cd Runs/Proton

# Run the job using mpirun with 12 processes
mpirun -np 12 cp2k.popt -i proton.inp -o proton_aimd.log
