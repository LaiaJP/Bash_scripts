#!/bin/bash

rm -f ptraj.in

cat <<eof > ptraj.in

trajin ../thb1_fe2_5c_wt.rst7
trajin ../eq/thb1_fe2_5c_wt_eq.nc
trajin ../md/thb1_fe2_5c_wt_md1.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md2.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md3.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md4.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md5.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md6.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md7.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md8.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md9.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md10.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md11.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md12.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md13.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md14.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md15.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md16.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md17.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md18.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md19.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md20.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md21.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md22.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md23.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md24.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md25.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md26.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md27.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md28.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md29.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md30.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md31.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md32.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md33.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md34.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md35.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md36.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md37.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md38.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md39.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md40.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md41.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md42.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md43.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md44.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md45.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md46.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md47.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md48.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md49.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md50.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md51.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md52.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md53.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md54.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md55.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md56.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md57.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md58.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md59.nc 1 1000 1
trajin ../md/thb1_fe2_5c_wt_md60.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md61.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md62.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md63.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md64.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md65.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md66.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md67.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md68.nc 1 1000 1
#trajin ../md/thb1_fe2_5c_wt_md69.nc 1 1000 1
 
autoimage
closest 500 :128,45,49,48,46,50,43
rms
trajout thb1_fe2_5c_wt_closest.nc netcdf

eof

cpptraj ../thb1_fe2_5c_wt.prmtop ptraj.in

rm ptraj.in
