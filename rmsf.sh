#!/bin/bash

rm rmsf.in

cat <<eof > rmsf.in

trajin ../cbs_fe2_nbCS-_100ns.nc 550 5000 1
rms @C,CA,N,O
atomicfluct out rmsf_cbs_fe2_nbCS-_100ns_bb.dat @C,CA,N,O byres
rms
atomicfluct out rmsf_cbs_fe2_nbCS-_100ns.dat byres

eof

cpptraj ../../cbs_fe2_nbCS-_w.prmtop rmsf.in

rm rmsf.in
