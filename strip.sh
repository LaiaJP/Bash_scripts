# se coore con: ptraj prmtop < ptraj.in > ptraj.out
# pasa los archivos tra y vel a CRDs

rm -f strip.in

cat <<eof > strip.in

parmstrip :HEM
parmstrip :WAT

parmwrite out thb1_fe2_5c_wt_ils.prmtop
exit

eof

cpptraj thb1_fe2_5c_wt_ff99.prmtop strip.in

rm strip.in

cat <<eof > strip.in

trajin ../thb1_fe2_5c_wt.nc 1 60201 1
strip :HEM
rms

trajout thb1_fe2_5c_wt_ils.nc netcdf

eof

cpptraj thb1_fe2_5c_wt_ff99.prmtop strip.in

rm strip.in

cat <<eof > strip.in

trajin ../thb1_fe2_5c_wt.nc 1 1 1
strip :HEM
rms

trajout thb1_fe2_5c_wt_ils.pdb pdb

eof

cpptraj thb1_fe2_5c_wt_ff99.prmtop strip.in

