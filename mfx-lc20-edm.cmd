#! /bin/bash

# Setup edm environment
source /reg/g/pcds/setup/epicsenv-3.14.12.sh

edm -x -m "IOC=CXI:LC20:IOC:01,DEV=MFX:LC20:SDS" -eolc lc20Screens/lc20.edl &
edm -x -m "IOC=CXI:LC20:IOC:01,DEV=MFX:LC20:SDSB" -eolc lc20Screens/lc20.edl &
edm -x -m "IOC=CXI:LC20:IOC:01,DEV=MFX:LC20:SDSC" -eolc lc20Screens/lc20.edl &
