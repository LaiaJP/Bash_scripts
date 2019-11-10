temp=300
KONSTANT=200

for i in 6 7 8 9 10 11 12 13 
 do

 mv thb1_fe2_5c_wt_dis${i}.rst7 thb1_fe2_5c_wt_dis${i}.0.rst7
 mv thb1_fe2_5c_wt_dis${i}.nc thb1_fe2_5c_wt_dis${i}.0.nc
 mv thb1_fe2_5c_wt_dis${i}.mdout thb1_fe2_5c_wt_dis${i}.0.mdout
 mv restrain_${i}.dat restrain_${i}.0.dat
 mv restrain_${i}.RST restrain_${i}.0.RST
 done

rm umb/*

for i in 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11.0 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12.0 12.1 12.2 12.3 12.4 12.5 12.6 12.7 12.8 12.9 13.0
do
  awk -v KONSTANT=${KONSTANT} -v CR_REF=${i} '{print $2, KONSTANT, CR_REF}' restrain_${i}.dat > umb/restr${i}.dat #temp${i}
done

