#!/bin/bash

if 

rm -f cbs.log

cat <<eof > cbs.log

parm98 = loadAmberParams /home/laia/cbs/top/param/hemo.prm
loadamberprep /home/laia/cbs/top/param/hem_fe3_hexa_cys.in
parm98 = loadAmberParams /home/laia/cbs/top/param/plp.prm
loadamberprep /home/laia/cbs/top/param/plp.in
parm98 = loadAmberParams /home/laia/cbs/top/param/lyx.prm
loadamberprep /home/laia/cbs/top/param/lyx.in
parm98 = loadAmberParams /home/laia/cbs/top/param/sam.prm
loadamberprep /home/laia/cbs/top/param/sam.in
parm98 = loadAmberParams /home/laia/cbs/top/param/cyx.prm
loadamberprep /home/laia/cbs/top/param/cyx_fe3.in

p=loadpdb cbs.pdb

savepdb p cbs_fe3_2.pdb
quit

eof

tleap -f cbs.log

then

rm -f cbs2.log

cat <<eof > cbs2.log

parm98 = loadAmberParams /home/laia/cbs/top/param/hemo.prm
loadamberprep /home/laia/cbs/top/param/hem_fe3_hexa_cys.in
parm98 = loadAmberParams /home/laia/cbs/top/param/plp.prm
loadamberprep /home/laia/cbs/top/param/plp.in
parm98 = loadAmberParams /home/laia/cbs/top/param/lyx.prm
loadamberprep /home/laia/cbs/top/param/lyx.in
parm98 = loadAmberParams /home/laia/cbs/top/param/sam.prm
loadamberprep /home/laia/cbs/top/param/sam.in
parm98 = loadAmberParams /home/laia/cbs/top/param/cyx.prm
loadamberprep /home/laia/cbs/top/param/cyx_fe3.in

p=loadpdb cbs_fe3_2.pdb

bond p.10.SG p.1009.FE
bond p.23.NE2 p.1009.FE
bond p.77.NZ p.1010.C4A
bond p.513.SG p.1012.FE
bond p.526.NE2 p.1012.FE
bond p.580.NZ p.1013.C4A

solvateOct p TIP3PBOX 10

saveAmberParm p cbs_fe3.prmtop cbs_fe3.rst7
savepdb p cbs_fe3+w.pdb
quit

eof

tleap -f cbs2.log

fi

rm cbs.log cbs2.log cbs_fe3_2.pdb
