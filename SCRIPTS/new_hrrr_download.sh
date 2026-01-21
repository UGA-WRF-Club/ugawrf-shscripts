#!/bin/bash

export PATH=/usr/bin:$PATH

cd /hdd/WRF/ForcingData

#set variables for hour,year,month, and day
hour_utc=$(date +"%-H")
year=$(date +"%Y")
month=$(date +"%m")
day=$(date +"%d")

#combine year,month, and day needed for the hrrr download
date=$year$month$day

echo $date
#based on time of run, script will download the appropriate hrrr files
#date is inserted into the url to download the correct file
if (( $hour_utc >= 2 && $hour_utc <7 ))
then
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf03.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf04.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf05.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf06.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf07.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf08.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf09.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf10.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf11.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf12.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf13.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf14.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf15.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf16.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf17.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf18.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf19.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf20.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf21.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf22.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf23.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf24.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf25.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf26.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t00z.wrfprsf27.grib2 &
        wait
elif (( $hour_utc >= 7 && $hour_utc <=13 ))
then
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf03.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf04.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf05.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf06.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf07.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf08.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf09.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf10.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf11.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf12.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf13.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf14.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf15.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf16.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf17.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf18.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf19.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf20.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf21.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf22.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf23.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf24.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf25.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf26.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t06z.wrfprsf27.grib2 &
        wait
elif (( $hour_utc >= 14 && $hour_utc <=19 ))
then
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf03.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf04.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf05.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf06.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf07.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf08.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf09.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf10.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf11.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf12.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf13.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf14.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf15.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf16.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf17.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf18.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf19.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf20.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf21.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf22.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf23.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf24.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf25.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf26.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t12z.wrfprsf27.grib2 &
        wait
else
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf03.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf04.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf05.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf06.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf07.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf08.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf09.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf10.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf11.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf12.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf13.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf14.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf15.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf16.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf17.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf18.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf19.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf20.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf21.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf22.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf23.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf24.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf25.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf26.grib2 &
        wget -nv https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t18z.wrfprsf27.grib2 &
        wait
fi
