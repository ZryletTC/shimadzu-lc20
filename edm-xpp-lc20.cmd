#! /bin/bash

# Setup edm environment
source /reg/g/pcds/setup/epicsenv-3.14.12.sh

edm -x -m "IOC=XPP:LC20:IOC:01,DEV=XPP:LC20:01" -eolc lc20Screens/lc20.edl &
