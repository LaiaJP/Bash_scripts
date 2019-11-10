temp=300
KONS1=200
KONS2=40

rm analisis/metadatafile

for i in  5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11.0 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12.0 12.1 12.2 12.3 12.4 12.5 12.6 12.7 12.8 12.9 13.0
#for i in 7.7
do

for a in {64..-66..-13} 
do
newa=$(echo "scale=6 ; ${a} * -3.141592 / 180" | bc)
awk '{print $1, $2, $3=$3*-3.141592/180}' ../restrain_dis${i}_dihe${a}.dat > restr_dis${i}_dihe${a}.dat

echo '../restr_dis'${i}'_dihe'${a}'.dat '${i}' '${newa}' '${KONS1}' '${KONS2}' '${temp} >> analisis/metadatafile
done

echo 'Coord ' ${i} ' done'

done

#/home/laia/2dumb_rest/wham/analisis

#./correr_wham.sh

