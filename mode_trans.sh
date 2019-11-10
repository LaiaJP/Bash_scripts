#!/bin/bash

if

cat <<eof > modes.in

trajin thb1_close.pdb pdb 1 1 1
trajin thb1_open.pdb pdb 1 1 1
strip :HEM
rms first  :1-129@CA,C,N,O
average opentoclose.pdb pdb :1-129@CA,C,N,O
matrix covar name covmat :1-129@CA,C,N,O out covaropentoclose.dat
analyze matrix covmat out opentoclosew_vec.dat vecs 30

eof

cpptraj thb1_close.prmtop modes.in

then

cat <<eof > modes2.in

trajin thb1_fe2_5c_wt_LysH_curt2.nc 1 -1 1
strip :HEM
rms first :1-129@CA,C,N,O
readdata opentoclosew_vec.dat
projection modes opentoclosew_vec.dat out dinopentoclosew-proj.dat beg 1 end 1 :1-129@CA,C,N,O

eof

cpptraj thb1_close.prmtop modes2.in

fi

rm modes.in modes2.in

cat <<eof > modes2.in

trajin thb1_close.pdb pdb 1 1 1
trajin thb1_open.pdb pdb 1 1 1
strip :HEM
rms first :1-129@CA,C,N,O
readdata opentoclosew_vec.dat
projection modes opentoclosew_vec.dat out opentoclosew-proj.dat beg 1 end 1 :1-129@CA,C,N,O

eof

cpptraj thb1_close.prmtop modes2.in

rm modes2.in
