#!/bin/bash

cd
cd /hdd/WRF/WRFV4.6.1/run

start_year=$(date +%Y)
start_month=$(date +%m)
start_day=$(date +%d)

end_year=$(date -d '+48 hour' '+%Y')
end_month=$(date -d '+48 hour' '+%m')
end_day=$(date -d '+48 hour' '+%d')

hour_utc=$(date +"%-H")

if (( $hour_utc >= 2 && $hour_utc <=7 ))
then
        start_hour=00
        end_hour=00
elif (( $hour_utc >= 8 && $hour_utc <=13 ))
then
        start_hour=06
        end_hour=06

elif (( $hour_utc >= 14 && $hour_utc <=19 ))
then
        start_hour=12
        end_hour=12

else
        start_hour=18
        end_hour=18

fi



sed -i "s/^\s*start_year\s*=.*/ start_year                          = $start_year, $start_year, $start_year,/" namelist.input
sed -i "s/^\s*start_month\s*=.*/ start_month                         = $start_month, $start_month, $start_month,/" namelist.input
sed -i "s/^\s*start_day\s*=.*/ start_day                           = $start_day, $start_day, $start_day,/" namelist.input
sed -i "s/^\s*start_hour\s*=.*/ start_hour                          = $start_hour, $start_hour, $start_hour,/" namelist.input
sed -i "s/^\s*end_year\s*=.*/ end_year                            = $end_year, $end_year, $end_year,/" namelist.input
sed -i "s/^\s*end_month\s*=.*/ end_month                           = $end_month, $end_month, $end_month,/" namelist.input
sed -i "s/^\s*end_day\s*=.*/ end_day                             = $end_day, $end_day, $end_day,/" namelist.input
sed -i "s/^\s*end_hour\s*=.*/ end_hour                            = $end_hour,  $end_hour, $end_hour,/" namelist.input
sed -i "s/^\s*num_metgrid_levels\s*=.*/ num_metgrid_levels                  = 41,/" namelist.input
sed -i "s/^\s*num_metgrid_soil_levels\s*=.*/ num_metgrid_soil_levels             = 9,/" namelist.input
sed -i "s/^\s*frames_per_outfile\s*=.*/ frames_per_outfile                  = 1, 1, 1,/" namelist.input


cd 
cd /hdd/WRF/WPS-4.6.0/

sed -i "s/^\s*start_date\s*=.*/ start_date = '$start_year-$start_month-${start_day}_$start_hour:00:00','$start_year-$start_month-${start_day}_$start_hour:00:00', '$start_year-$start_month-${start_day}_$start_hour:00:00', /" namelist.wps
sed -i "s/^\s*end_date\s*=.*/ end_date   = '$end_year-$end_month-${end_day}_$end_hour:00:00','$end_year-$end_month-${end_day}_$end_hour:00:00', '$end_year-$end_month-${end_day}_$end_hour:00:00',/" namelist.wps

cd

cd