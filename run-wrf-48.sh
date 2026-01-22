#!/bin/bash
source /opt/intel/oneapi/setvars.sh
set -e
ulimit -s unlimited

#### REMOVE ALL FILES THAT WERE CREATED FROM PAST RUN (except the output) ####
echo "Removing Old Files"
cd
cd /hdd/WRF/ForcingData
rm -f hrrr*

cd
cd /hdd/WRF/WPS-4.6.0
rm -f FILE* GRIBFILE.A* PFILE* met_em* geo_em*

cd
cd /hdd/WRF/WRFV4.6.1/run
rm -f met_em* wrfbdy* wrfinput*
#############################################################################


#### GET HRRR DATA ####
echo "Downloading New Forcing Data"
cd /hdd/WRF/SCRIPTS
./new_hrrr_download_48.sh
./file_changes_48.sh
cd

cd /hdd/WRF/WPS-4.6.0
./geogrid.exe
./link_grib.csh /hdd/WRF/ForcingData/hrr*
ln -sf ungrib/Variable_Tables/Vtable.HRRR Vtable
#######################


#### RUN ‘ungrib’ AND ‘metgrib’ ####
echo "Running ungrib and metgrib"
cd /hdd/WRF/WPS-4.6.0
./ungrib.exe
mpiexec -np 4 ./metgrid.exe
##############################


#### MOVE FILES TO WRF DIRECTORY, RUN ‘real’ AND RUN ‘wrf’ ####
echo "Running real and wrf"
WRF_DIR="/hdd/WRF/WRFV4.6.1/run"
cd
cd $WRF_DIR

ln -sf /hdd/WRF/WPS-4.6.0/met_em* .

mpiexec -np 48 ./real.exe

### start partial plotter ###
watchdog() {
    source /opt/conda/etc/profile.d/conda.sh
    echo "starting the partial watchdog!"
    mkdir -p processed_logs
    touch processed_list.txt

    while pgrep -x "wrf.exe" > /dev/null || [ -n "$(ls wrfout_d01_* 2>/dev/null | grep -vFf processed_list.txt)" ]; do
        files=$(ls wrfout_d01_* 2>/dev/null | sort)
        latest_file=$(echo "$files" | tail -n 1)
        for f in $files; do
            if grep -q "$f" processed_list.txt; then continue; fi
            if [[ "$f" != "$latest_file" ]] || ! pgrep -x "wrf.exe" > /dev/null; then
                echo "completed hour: $f"
                conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$f /hdd/ugawrf-py/outputs -r 14 -p
                echo "$f" >> processed_list.txt
                gsutil -m cp /hdd/ugawrf-py/outputs/* gs://uga-wrf-website/outputs &
            fi
        done
        sleep 30
    done
}
watchdog &
WATCHDOG_PID=$!

mpiexec -np 48 ./wrf.exe
wait $WATCHDOG_PID
###################################################

### stitch
echo "stitching"
FIRST_FILE=$(ls wrfout_d01_* | sort | head -n 1)
echo "start time filename: $FIRST_FILE"
ncrcat wrfout_d01_* combined.nc
rm wrfout_d01_*
mv combined.nc "$FIRST_FILE"

#### (fully) VISUALIZE DATA ####
source /opt/conda/etc/profile.d/conda.sh
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$FIRST_FILE /hdd/ugawrf-py/outputs -r 2345 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$FIRST_FILE /hdd/ugawrf-py/outputs -r 1345 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$FIRST_FILE /hdd/ugawrf-py/outputs -r 1245 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$FIRST_FILE /hdd/ugawrf-py/outputs -r 1235 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/$FIRST_FILE /hdd/ugawrf-py/outputs -r 1234 &
wait
#######################


#### OUTPUT WRF FILES TO CLOUD BUCKET ####
gsutil mv $WRF_DIR/$FIRST_FILE gs://wrf-bucket/wrf-outputs &
gsutil -m mv /hdd/ugawrf-py/outputs/* gs://uga-wrf-website/outputs &
wait

echo "wrf run reached end of shell script, probably finished"
date
############################################
