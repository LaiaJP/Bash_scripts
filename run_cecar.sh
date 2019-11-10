#!/bin/bash

# Ejecuta un programa con uso de gpu, usando una gpu por nodo, en 4 nodos.

#SBATCH --job-name="2umbtot"
#SBATCH --nodes=1
#SBATCH --workdir=/home/ljulio/2dumb
#SBATCH --error="2dumb-%j.err"
#SBATCH --output="2dumb-%j.out"
#SBATCH --partition=batch-gpu
#SBATCH --account=inquimae
#SBATCH --gres=gpu:1
#SBATCH --time=72:00:00

echo "trabajo \"${SLURM_JOB_NAME}\""
echo "    id: ${SLURM_JOB_ID}"
echo "    partición: ${SLURM_JOB_PARTITION}"
echo "    nodos: ${SLURM_JOB_NODELIST}"
echo
date +"inicio %F - %T"

echo "
--------------------------------------------------------------------------------
"

# INICIO VARIABLES IMPORTANTES
#
# NO TOCAR. No se aceptaron reclamos en caso de modificar estas líneas. Deberán
# incluirlas siempre, hasta próximo aviso.
#
[ -r /etc/profile.d/odin-users.sh ] && . /etc/profile.d/odin-users.sh
#
# FIN VARIABLES IMPORTANTES

# El path al programa es `/home/USUARIO/ejemplos/programa-gpu`. Como más arriba
# seteamos el directorio de trabajo a `/home/USUARIO/ejemplos`, el programa se
# encuentra en el directorio de trabajo, por lo que basta poner
# `./programa-gpu`.

#for i in 7.6 7.7 7.8 7.9 8 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12
#for i in 12.1 12.2 12.3 12.4 12.5 12.6 12.7 12.8 12.9 13
for i in 12.4 12.5 12.6 12.7 12.8 12.9 13
do

dihe_max=$(echo $i | awk '{printf $i *3}')
dihe_min=$(echo $i | awk '{printf $i /3}')

for a in {64..64..-13}
do
if [ $a -gt 0 ]
then
dihe_max2=$(echo $a | awk '{printf $a *3}')
dihe_min2=$(echo $a | awk '{printf $a /3}')
else
dihe_min2=$(echo $a | awk '{printf $a *3}')
dihe_max2=$(echo $a | awk '{printf $a /3}')
fi
cat <<eof > restrain_dis${i}_dihe${a}.RST

&rst iat=-1,1979, igr1=755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770 r1=${dihe_min}, r2=${i}, r3=${i}, r4=${dihe_max}, rk2=100., rk3=100.,  /
&rst iat=740,737,734,731, r1=${dihe_min2}, r2=${a}, r3=${a}, r4=${dihe_max2}, rk2=20., rk3=20.,  /
&end

eof

cat <<eof > mdin

   &cntrl
    imin=0,irest=1,ntx=5,

     ntb=2,ntp=1,

     NSTLIM= 5000000, DT=.002,
     NTC=2,NTF=2,nrespa=1,

     ntt=3,temp0=300.0,gamma_ln=2.0,
     ntpr=2500,ntwx=2500,ntwv=0,ntwe=100,ioutfm=1
     iwrap=1,nmropt=1,
     cut = 10.0,
   &end
   /
   &wt type='DUMPFREQ', istep1=1 /
   &wt type='END'   /
  DISANG=restrain_dis${i}_dihe${a}.RST
  DUMPAVE=restrain_dis${i}_dihe${a}.dat
  LISTIN=POUT
  LISTOUT=POUT

eof

if [ $a -eq 64 ]
then  
z=$(echo $i | awk '{printf $i -0.1}')
z1=$(echo $a | awk '{printf $a}')
else
z=$(echo $i | awk '{printf $i} ')
z1=$(echo $a | awk '{printf $a +13}')
fi

  pmemd.cuda -O -i mdin -o thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}.mdout -p thb1_fe2_5c_wt_LysH.prmtop -c thb1_fe2_5c_wt_LysH_dis${z}_dihe${z1}.rst7 -r thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}.rst7 -x thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}.nc
  rm mdin

mv thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}.rst7 thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}_vell.rst7

cat <<eof > ptraj.in
trajin thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}_vell.rst7
center :1-128
autoimage
trajout thb1_fe2_5c_wt_LysH_dis${i}_dihe${a}.rst7 restart
eof

cpptraj thb1_fe2_5c_wt_LysH.prmtop  ptraj.in 

rm ptraj.in 
done
done

echo "
--------------------------------------------------------------------------------
"

date +"fin %F - %T"


