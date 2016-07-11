# getS2
getS2 is a TCL script for get S2 values (Order parameter) from your simulations.

Order parameter is a measure of flexibility from range 1-0 where 1 is absolutly rigid and 0 flexible.
If your experimental values are close to simulated, congratulations!, your simulations are closer to represents behavior of your experiments.

##Requisites
* VMD >= 1.9.2


##Usage
first charge the function (and your simulation) on VMD TK console:

	source getS2.tcl
  
then:
	
	orderparam-protein "protein"

and go for a coffee, the output is a file called "s2.dat" with the resid number and corresponden order parameter value.

##Times
getS2 can't be parallelized so the times increases as long as simulated time you have (frames), 5000 frames can take 1 hour in and standar pc.

##CITATIONS
the formula was extracted from: 
* Indira Chandrasekhar, G. Marius Clore, Attila Szabo, Angela M. Gronenborn and Bernard R. Brooks. A 500 ps Molecular Dynamics Simulation Study of Interleukin-lfl in Water Correlation with Nuclear Magnetic Resonance Spectroscopy and Crystallography. J. Mol. Biol. (1992) 226, 239-250.
