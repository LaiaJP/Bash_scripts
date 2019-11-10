#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l gpu=1 #n gpus
#$ -pe mpich 1 #n cpu
#$ -q 1080.q,all.q
#$ -N thb15cwt #nombre proceso

source /home/laia/whichgpu.sh

export CUDA_VISIBLE_DEVICES=`/share/apps/freegpu.sh`

cd /home/laia/thb1_fe2_5c_wt/min

rm min.in

cat <<eof > min.in

Equilibration
 &cntrl
   irest=0, ntx=1,imin=1,
   ncyc=20000,maxcyc=100000,

   NSTLIM= 1000000, DT=.002,
   NTC=2,NTF=2,nrespa=1,

   ntt=3,
   ntpr=100,ntwx=100,ntwe=100,
 /
 &wt TYPE='END'
 /

eof

pmemd.cuda -O\
 -i min.in\
 -p ../thb1_fe2_5c_wt.prmtop\
 -c ../thb1_fe2_5c_wt.rst7\
 -r thb1_fe2_5c_wt_em.rst7\
 -o thb1_fe2_5c_wt_em.out


rm min.in

cat <<eof > min.in

Equilibration
 &cntrl
   irest=0, ntx=1,imin=1,
   ncyc=20000,maxcyc=100000,

   NSTLIM= 1000000, DT=.002,
   NTC=2,NTF=2,nrespa=1,

   ntt=3,
   ntpr=100,ntwx=100,ntwe=100,
 /
 &wt TYPE='END'
 /

eof

pmemd.cuda -O\
 -i min.in\
 -p ../thb1_fe2_5c_wt.prmtop\
 -c thb1_fe2_5c_wt_em.rst7\
 -r thb1_fe2_5c_wt_em.rst7\
 -o thb1_fe2_5c_wt_em.out

cd /home/laia/thb1_fe2_5c_wt/eq

cat <<eof > eq.in

 &cntrl
  imin=0,irest=0,ntx=1,nmropt=1,

   ntb=1,ntp=0,

   NSTLIM= 500000, DT=.002,
   NTC=2,NTF=2,nrespa=1,

   ntt=3,temp0=300.0,gamma_ln=2,tempi=0.0,ig=-1,
   ntpr=2500,ntwx=2500,ntwv=0,ntwe=100,
   iwrap=1,
   cut = 10.0,
 &wt type='TEMP0', istep1=0, istep2=400000,
   value1=0.0, value2=300.0, /
 &wt type='TEMP0', istep1=400000, istep2=500000,
   value1=300.0, value2=300.0, /
 &wt type='END'
 &wt type='END'   /

eof

pmemd.cuda -O\
 -i eq.in\
 -p ../thb1_fe2_5c_wt.prmtop\
 -c ../min/thb1_fe2_5c_wt_em.rst7\
 -ref ../min/thb1_fe2_5c_wt_em.rst7\
 -r thb1_fe2_5c_wt_md0.rst7\
 -o thb1_fe2_5c_wt_eq.out\
 -x thb1_fe2_5c_wt_eq.nc


rm eq.in

cp thb1_fe2_5c_wt_md0.rst7 /home/laia/thb1_fe2_5c_wt/md

cd /home/laia/thb1_fe2_5c_wt/md


cat <<eof > mdin

 &cntrl
  imin=0,irest=1,ntx=5,

   ntb=2,ntp=1,

   NSTLIM= 2500000, DT=.002,
   NTC=2,NTF=2,nrespa=1,

   ntt=3,temp0=300.0,gamma_ln=2,
   ntpr=2500,ntwx=2500,ntwv=0,ntwe=100,ioutfm=1
   iwrap=1,

   cut = 10.0,
 &end

eof

for i in {1..60..1}

 do
  let z=$i-1

pmemd.cuda -O -i mdin -o thb1_fe2_5c_wt_md${i}.mdout -p ../thb1_fe2_5c_wt.prmtop -c thb1_fe2_5c_wt_md${z}.rst7 -r thb1_fe2_5c_wt_md${i}.rst7 -x thb1_fe2_5c_wt_md${i}.nc
 done

rm mdin


