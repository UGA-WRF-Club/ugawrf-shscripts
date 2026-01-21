#!/bin/bash

export PATH=/usr/bin:$PATH

cd /hdd/WRF/ForcingData

hour_utc=$(date +"%-H")
year=$(date +"%Y")
month=$(date +"%m")
day=$(date +"%d")
date=$year$month$day

echo "downloading HRRR for $date"

download_hrrr() {
    local cycle=$1
    for i in {0..48}; do
        f_hour=$(printf "%02d" $i)
        url="https://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr.$date/conus/hrrr.t${cycle}z.wrfprsf${f_hour}.grib2"
        wget -nv "$url" &
        if (( $i % 10 == 0 )); then
            wait
        fi
    done
    wait
}

if (( $hour_utc >= 2 && $hour_utc <7 )); then
    download_hrrr "00"
elif (( $hour_utc >= 7 && $hour_utc <=13 )); then
    download_hrrr "06"
elif (( $hour_utc >= 14 && $hour_utc <=19 )); then
    download_hrrr "12"
else
    download_hrrr "18"
fi