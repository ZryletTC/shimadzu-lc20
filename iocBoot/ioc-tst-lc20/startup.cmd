#!/bin/bash

# Set the IOC name
export IOC="ioc-tst-lc20"

# Setup the IOC user environment
# TODO: Change xxx as needed for your hutch
source /reg/d/iocCommon/All/tst_env.sh

# For release
#cd $EPICS_SITE_TOP/ioc/xxx/lc20/R0.1.0/iocBoot/ioc-tst-lc20

# Copy the archive file to iocData
#$RUNUSER "cp ../../archive/$IOC.archive $IOC_DATA/$IOC/archive"

# Launch the IOC
$RUNUSER "$PROCSERV --logfile $IOC_DATA/$IOC/iocInfo/ioc.log --name $IOC 30020 ../../bin/linux-x86_64/lc20 st.cmd"
