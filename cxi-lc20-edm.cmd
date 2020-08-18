#! /bin/bash

# Setup edm environment
source /reg/g/pcds/setup/epicsenv-3.14.12.sh

edm -x -m "IOC=CXI:LC20:IOC:01,DEV=CXI:LC20:SDSB" -eolc lc20Screens/lc20.edl &
