#! /bin/bash

cd
cd /hdd/WRF/WRFV4.6.1/run

#get year,month,day and hour needed for wrf namelist changes
start_year=$(date +%Y)
start_month=$(date +%m)
start_day=$(date +%d)

end_year=$(date -d '+24 hour' '+%Y')
end_month=$(date -d '+24 hour' '+%m')
end_day=$(date -d '+24 hour' '+%d')

hour_utc=$(date +"%-H")

#set the model start and end hour based on the time of the run
if (( $hour_utc >= 2 && $hour_utc <=7 ))
then
        start_hour=03
        end_hour=03
elif (( $hour_utc >= 8 && $hour_utc <=13 ))
then
        start_hour=09
        end_hour=09

elif (( $hour_utc >= 14 && $hour_utc <=19 ))
then
        start_hour=15
        end_hour=15

else
        start_hour=21
        end_hour=21

fi

#change the namelist in the run directory with the dates of the run

sed -i "6s/.*/ start_year                          = $start_year, $start_year, $start_year,/" namelist.input
sed -i "7s/.*/ start_month                         = $start_month, $start_month, $start_month,/" namelist.input
sed -i "8s/.*/ start_day                           = $start_day, $start_day, $start_day,/" namelist.input
sed -i "9s/.*/ start_hour                          = $start_hour, $start_hour, $start_hour,/" namelist.input
sed -i "10s/.*/ end_year                            = $end_year, $end_year, $end_year,/" namelist.input
sed -i "11s/.*/ end_month                           = $end_month, $end_month, $end_month,/" namelist.input
sed -i "12s/.*/ end_day                             = $end_day, $end_day, $end_day,/" namelist.input
sed -i "13s/.*/ end_hour                            = $end_hour,  $end_hour, $end_hour,/" namelist.input

#change the metrid levels based on hrrr input
sed -i "48s/.*/ num_metgrid_levels                  = 41,/" namelist.input
sed -i "49s/.*/ num_metgrid_soil_levels             = 9,/" namelist.input

cd 
cd /hdd/WRF/WPS-4.6.0/

#set start and end date in the wps namelist file
sed -i "4s/.*/ start_date = '$start_year-$start_month-${start_day}_$start_hour:00:00','$start_year-$start_month-${start_day}_$start_hour:00:00', '$start_year-$start_month-${start_day}_$start_hour:00:00', /" namelist.wps
sed -i "5s/.*/ end_date   = '$end_year-$end_month-${end_day}_$end_hour:00:00','$end_year-$end_month-${end_day}_$end_hour:00:00', '$end_year-$end_month-${end_day}_$end_hour:00:00',/" namelist.wps

cd
