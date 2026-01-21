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

mpiexec -np 48 ./wrf.exe
###################################################


#### VISUALIZE DATA ####
source /opt/conda/etc/profile.d/conda.sh
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/wrfout_d01* /hdd/ugawrf-py/outputs -r 2345 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/wrfout_d01* /hdd/ugawrf-py/outputs -r 1345 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/wrfout_d01* /hdd/ugawrf-py/outputs -r 1245 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/wrfout_d01* /hdd/ugawrf-py/outputs -r 1235 &
conda run -n ugawrf_postproc --live-stream python /hdd/WRF/ugawrf-py/ugawrf.py $WRF_DIR/wrfout_d01* /hdd/ugawrf-py/outputs -r 1234 &
wait
#######################


#### OUTPUT WRF FILES TO CLOUD BUCKET ####
gsutil mv $WRF_DIR/wrfout_d01* gs://wrf-bucket/wrf-outputs &
gsutil -m mv /hdd/ugawrf-py/outputs/* gs://uga-wrf-website/outputs &
wait
############################################
