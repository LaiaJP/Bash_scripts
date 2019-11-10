#!/bin/bash

rm -f rmsd.in

cat <<eof > rmsd.in

trajin ../../md/cbs_Fe2_nbCS-_md1.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md2.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md3.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md4.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md5.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md6.nc 1 500 5
trajin ../../md/cbs_Fe2_nbCS-_md7.nc 1 500 5
#trajin ../../md/cbs_Fe2_nbCS-_md8.nc 1 500 5
#trajin ../../md/cbs_Fe2_nbCS-_md9.nc 1 500 5
#trajin ../../md/cbs_Fe2_nbCS-_md10.nc 1 500 5

autoimage
strip :WAT
strip :HEM
strip :PLP
strip :SAM

rms first :1-1008 out rmsd_cbs_Fe2_nbCS-.agr
rms first :1-1008@C,CA,N,O out rmsd_cbs_Fe2_nbCS-_bb.agr
rms first :1-353,504-856 out rmsd_cbs_Fe2_nbCS-_nCt.agr

eof

cpptraj ../../parmed/cbs_Fe2_nbCS-_2.prmtop rmsd.in

rm rmsd.in

