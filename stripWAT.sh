#!/bin/bash

rm stripWAT.in

cat <<eof > stripWAT.in

parmstrip :WAT
parmwrite out thb1_fe2_5c_wt_w.prmtop
exit

eof

cpptraj thb1_fe2_5c_wt.prmtop stripWAT.in

rm stripWAT.in
