#!/bin/bash

if 

rm modes.in

cat <<eof > modes.in

trajin ../cbs_fe2_wt_mutR266M_100ns.nc 300 5000 1
strip :HEM
strip :PLP
strip :SAM
rms first :10-357,358-714@CA,C,N,O
average cbs_fe2_wt_mutR266M.pdb pdb :10-357,358-714@CA,C,N,O
matrix covar name covamat :10-357,358-714@CA,C,N,O out covar_cbs_fe2_wt_mutR266M.dat
analyze matrix covamat out cbs_fe2_wt_mutR266M_vec.dat vecs 30

eof

cpptraj ../../cbs_fe2_wt_mutR266M_w.prmtop modes.in

then

rm modes2.in

cat <<eof > modes2.in

trajin ../cbs_fe2_wt_mutR266M_100ns.nc 300 5000 1
strip :HEM
strip :PLP
strip :SAM
rms first :10-357,358-714@CA,C,N,O
readdata cbs_fe2_wt_mutR266M_vec.dat
projection modes cbs_fe2_wt_mutR266M_vec.dat out cbs_fe2_wt_mutR266M-proj.dat beg 1 end 5 :10-357,358-714@CA,C,N,O

eof

cpptraj ../../cbs_fe2_wt_mutR266M_w.prmtop modes2.in

fi

rm modes.in modes2.in
