# Gaussian16-note
Collect the template for basics and advance Gaussian run.

## IRC simulation for R-TS-P process
Folder "1_IRC-calculation-TS" contain the input example for simulate the intrinsic reaction coordinate (IRC). for the reaction of Reactant (R) --> Transition State (TS) --> Product (P)
The step of calculaiton
1. run optimization the search TS configuration. You need to guess the near TS configuration if possible and DO NOT using the relaxed configuration. Otherwise the calculation will be failed. 
By using template "1_opt_ts.gjf". Note that the section after coordinate is for /gen basis set feature. remove it and change basis set to yours.

2. get the TS geomerty to the IRC input file. Make sure that geomerty had one negative frequency as the TS.

3. run irc calculation to search the reactant and product as the left and right of that Transition state. 
By using template "2_irc.gjf". Replace the coordinate to the TS geometry. Note that the section after coordinate is for /gen basis set feature. remove it and change basis set to yours.
