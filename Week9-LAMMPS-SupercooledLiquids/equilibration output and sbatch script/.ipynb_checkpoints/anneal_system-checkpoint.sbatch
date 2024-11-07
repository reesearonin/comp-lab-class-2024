#!/bin/bash
#SBATCH --job-name=anneal_system
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=02:00:00
#SBATCH --mem=4G
#SBATCH --output=anneal_system.out
#SBATCH --error=anneal_system.err

source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Create the system
echo "Creating the system..."
mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/create_3d_binary.lmp

# Define temperatures for annealing
temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475 0.45)

# Loop through temperatures and run annealing
for i in "${!temperatures[@]}"; do
    if [ $i -lt $((${#temperatures[@]} - 1)) ]; then
        current_temp=${temperatures[$i]}
        next_temp=${temperatures[$((i + 1))]}
        
        echo "Annealing from T${current_temp} to T${next_temp}..."
        mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${current_temp}.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp
    fi
done

echo "Annealing process completed."
