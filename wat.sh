#!/bin/bash

rm -f rmsd.in

cat <<eof > rmsd.in

trajin ../../thb1_fe2_wt_1atm.rst7              
trajin ../../eq/thb1_fe2_wt_1atm_eq.nc          
trajin ../../md/thb1_fe2_wt_1atm_md1.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md2.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md3.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md4.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md5.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md6.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md7.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md8.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md9.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md10.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md11.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md12.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md13.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md14.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md15.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md16.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md17.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md18.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md19.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md20.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md21.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md22.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md23.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md24.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md25.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md26.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md27.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md28.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md29.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md30.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md31.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md32.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md33.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md34.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md35.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md36.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md37.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md38.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md39.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md40.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md41.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md42.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md43.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md44.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md45.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md46.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md47.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md48.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md49.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md50.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md51.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md52.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md53.nc 1 1000 1 
trajin ../../md/thb1_fe2_wt_1atm_md54.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md55.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md56.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md57.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md58.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md59.nc 1 1000 1
trajin ../../md/thb1_fe2_wt_1atm_md60.nc 1 1000 1

autoimage

watershell :49@NZ out aguasxframe.dat noimage

eof

cpptraj ../../thb1_fe2_wt_1atm.prmtop rmsd.in

rm rmsd.in

