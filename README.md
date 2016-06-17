# getS2
getS2 is a TCL script for get S2 values (order parameter) from your simulations.
Order parameter is a measure of flexibility from range 1-0 where 1 is absolutly rigid and 0 flexible.

##Usage
first charge the function (and your simulation)
  source getS2.tcl
  
then
  orderparam-protein "protein"

and go for a coffee, the output is a file called "s2.dat" with the resid number and corresponden order parameter value.
