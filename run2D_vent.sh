#!/bin/bash

#for i in 5.5 5.6 5.7 5.8 5.9 6 6.1 6.2 6.3 #6.4 6.5 6.6 6.7 6.8 6.9 7 7.1 7.2 7.3 7.4 7.5 7.6 7.8 7.9 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12 12.1 12.2 12.3 12.4 12.5 12.6 12.7 12.8 12.9 13 
for i in  7.6 7.7 7.8 7.9 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9
do
cat <<eof > vent_${i}.sh
#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l gpu=1 #n gpus
#$ -pe mpich 1 #n cpu
#$ -q 1080.q,all.q
#$ -N umb2d${i} #nombre proceso

source /home/laia/whichgpu.sh

export CUDA_VISIBLE_DEVICES=\`/share/apps/freegpu.sh\`

dihe_max=$(echo $i | awk '{printf $i *3}')
dihe_min=$(echo $i | awk '{printf $i /3}')

for a in {-66..-66..-13}

do
if [ \$a -gt 0 ]
then
dihe_max2=\$(echo \$a | awk '{printf \$a *3}')
dihe_min2=\$(echo \$a | awk '{printf \$a /3}')
else
dihe_min2=\$(echo \$a | awk '{printf \$a *3}')
dihe_max2=\$(echo \$a | awk '{printf \$a /3}')
fi
echo " 
&rst iat=-1,1979, igr1=755,756,757,758,759,760,761,762,763,764,765,766,767,768,769 r1=\${dihe_min}, r2=${i}, r3=${i}, r4=\${dihe_max}, rk2=100., rk3=100.,  /
&rst iat=740,737,734,731, r1=\${dihe_min2}, r2=\${a}, r3=\${a}, r4=\${dihe_max2}, rk2=20., rk3=20.,  /
&end
" > restrain_dis${i}_dihe\${a}.RST

echo "
   &cntrl
    imin=0,irest=1,ntx=5,

     ntb=2,ntp=1,

     NSTLIM= 5000000, DT=.002,
     NTC=2,NTF=2,nrespa=1,

     ntt=3,temp0=300.0,gamma_ln=2.0,
     ntpr=10000,ntwx=10000,ntwv=0,ntwe=400,ioutfm=1
     iwrap=1,nmropt=1,
     cut = 10.0,
   &end
   /
   &wt type='DUMPFREQ', istep1=1 /
   &wt type='END'   /
  DISANG=restrain_dis${i}_dihe\${a}.RST
  DUMPAVE=restrain_dis${i}_dihe\${a}.dat
  LISTIN=POUT
  LISTOUT=POUT" > mdin${i}

if [ \$a -eq 64 ]
then  
z=\$(echo $i | awk '{printf $i -0.1}')
z1=\$(echo \$a | awk '{printf \$a}')
else
z=\$(echo $i | awk '{printf $i} ')
z1=\$(echo \$a | awk '{printf \$a +13}')
fi

  pmemd.cuda -O -i mdin${i} -o thb1_fe2_5c_wt_dis${i}_dihe\${a}.mdout -p thb1_fe2_5c_wt.prmtop -c thb1_fe2_5c_wt_dis\${z}_dihe\${z1}.rst7 -r thb1_fe2_5c_wt_dis${i}_dihe\${a}.rst7 -x thb1_fe2_5c_wt_dis${i}_dihe\${a}.nc
  rm mdin${i}

mv thb1_fe2_5c_wt_dis${i}_dihe\${a}.rst7 thb1_fe2_5c_wt_dis${i}_dihe\${a}_vell.rst7

echo "trajin thb1_fe2_5c_wt_dis${i}_dihe\${a}_vell.rst7
center :1-128
autoimage
trajout thb1_fe2_5c_wt_dis${i}_dihe\${a}.rst7 restart" > ptraj.in

cpptraj thb1_fe2_5c_wt.prmtop  ptraj.in 

rm ptraj.in 
done

eof
chmod +x vent_${i}.sh 
qsub  vent_${i}.sh
done
