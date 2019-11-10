#!/bin/bash

name=Lys-wat
name2=Fe-Lys
name3=Fe-LysH

#Copiar cosas
cp ../lowspin/disFeLys/thb1LyswtH3O.rce low_Fe-Lys.rce
cp ../midspin/disFeLys/thb1LyswtH3O.rce mid_Fe-Lys.rce
cp ../highspin/disFeLys/thb1LyswtH3O.rce high_Fe-Lys.rce

#######################################################################################################
##Curva distancia Lys-WAT
#cat *_${name}.rce > temp
#awk '{print $2}' temp > temp1
#awk 'NR==1 { MIN=$a; next }  $a < MIN { MIN=$a } {print MIN}' temp1 > temp2
#min=`tail -n 1 temp2`
#for i in "low" "mid" "high"
#do
#awk -v tempu=$min '{printf $1 "\t" "%.7f\n",$2 = ($2-tempu)*23.601}' ${i}_${name}.rce > ${name}_${i}_curvafin.rce
#done
#
#rm temp temp1 temp2
#
######################################################################################################
#Curva distancia Fe-Lys
cat *_${name2}.rce > temp
awk '{print $2}' temp > temp1
awk 'NR==1 { MIN=$a; next }  $a < MIN { MIN=$a } {print MIN}' temp1 > temp2
min=`tail -n 1 temp2`
for i in "low" "mid" "high"
do
awk -v tempu=$min '{printf $1 "\t" "%.7f\n",$2 = ($2-tempu)*23.601}' ${i}_${name2}.rce > ${name2}_${i}_curvafin.rce
done

rm temp temp1 temp2

#######################################################################################################
##Curva distancia Fe-LysH
#cat *_${name3}.rce > temp
#awk '{print $2}' temp > temp1
#awk 'NR==1 { MIN=$a; next }  $a < MIN { MIN=$a } {print MIN}' temp1 > temp2
#min=`tail -n 1 temp2`
#for i in "low"  "high"
#do
#awk -v tempu=$min '{printf $1 "\t" "%.7f\n",$2 = ($2-tempu)*23.601}' ${i}_${name3}.rce > ${name3}_${i}_curvafin.rce
#done
#
#rm temp temp1 temp2

