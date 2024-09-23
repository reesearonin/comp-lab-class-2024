This contains a structure and a trajectory file for a 10ns simulation on the trp-cage 2JOF protein. The protein has been wrapped in a box and water has been removed. 
2jof_ForVMD_noWater_Wrapped.gro is the structure file.
2jof_ForVMD_noWater_Wrapped.xtc is the trajectory file. 
All files required to run the simulation again are included:
index.ndx allows for specifying which parts of the system are analyzed (seperating protein from solvent)
md.mdp was downloaded from the lysozome tutorial and gives parameters adn constraints for the molecular dynamics simulation.
npt.cpt is a checkpoint file which contains information about the pressure.
npt.gro is a structure file generated after the NPT equilibration.
output_topology.top is the topology file which gives specifications about the atoms in the trp-cage protein. 
