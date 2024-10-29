#!/bin/bash

# Define the density range
start_density=0.5
end_density=1.1
increment=0.1

# Create a directory for logs if it doesn't exist
mkdir -p logs

# Loop through densities
for density in $(seq $start_density $increment $end_density); do
    # Create a log file for the current density
    log_file="logs/LOGFILE_density_${density}.log"
    
    # Run LAMMPS simulation with the current density
    # Assuming you have a way to set density in your input script, replace the input_file with your actual input script
    mpirun -np 1 lmp -in 2dWCA.in -var density $density -log "$log_file"

    echo "Simulation run for density $density, log saved to $log_file"
done
