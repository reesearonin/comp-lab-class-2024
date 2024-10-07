adp_T300.mdp was edited for the T400 and T600 runs.
ref_t and gen_temp were changed to reflect the temperature in each file. 
For T300, ref_t and gen_temp were set to 300
For T400 ref_t and gen_temp were set to 363
For T600 ref_t and gen_temp were set to 440

adp.tpr files were generated in each directory by running:
gmx_mpi grompp -f adp_T300.mdp -c adp.gro -p adp.top -o adp.tpr
gmx_mpi grompp -f adp_T400.mdp -c adp.gro -p adp.top -o adp.tpr
gmx_mpi grompp -f adp_T600.mdp -c adp.gro -p adp.top -o adp.tpr