#! /bin/bash

# Setup edm environment
source /reg/g/pcds/setup/epicsenv-3.14.12.sh

edm -x -m "IOC=AMO:LC20:IOC:01,DEV=AMO:LC20:SDS" -eolc lc20Screens/lc20.edl &
