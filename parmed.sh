#!/bin/bash

rm -f parmed.in

cat <<eof > parmed.in

loadRestrt ../cbs_Fe2_nbCS-.rst7
setmolecules False
outparm cbs_Fe2_nbCS-_2.prmtop


eof

parmed.py ../cbs_Fe2_nbCS-.prmtop parmed.in

rm parmed.in 

