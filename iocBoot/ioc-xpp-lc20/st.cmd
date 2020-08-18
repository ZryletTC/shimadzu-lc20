#!../../bin/linux-x86_64/lc20


< envPaths
epicsEnvSet( "ENGINEER",  "Alex Wallace (awallace)" )
epicsEnvSet( "LOCATION",  "XPP:LC20:IOC:01" )
epicsEnvSet( "IOCSH_PS1", "$(IOC)> " )
epicsEnvSet( "STREAM_PROTOCOL_PATH", "$(TOP)/lc20App/srcProtocol" )
cd( "../.." )

# Run common startup commands for linux soft IOC's
< /reg/d/iocCommon/All/pre_linux.cmd

# Register all support components
dbLoadDatabase("dbd/lc20.dbd")
lc20_registerRecordDeviceDriver(pdbbase)

# Set this to enable LOTS of stream module diagnostics
#var streamDebug 1

# Configure each device
epicsEnvSet( "DEV1", "XPP:LC20:01" )
drvAsynIPPortConfigure( "$(DEV1)", "digi-xpp-13.pcdsn:2104 TCP", 0, 0, 0 )

# Load record instances
dbLoadRecords( "db/iocAdmin.db",			"IOC=$(IOC)" )
dbLoadRecords( "db/save_restoreStatus.db",	"IOC=$(IOC)" )
dbLoadRecords( "db/lc20.db",		"DEV=$(DEV1),PORT=$(DEV1)" )


# Optional: Enable tracing
#asynSetTraceIOMask( "$(DEV1)",	0,		2 )
#asynSetTraceMask(   "$(DEV1)",	0,		9 )

# Send trace output to motor specific log files
#asynSetTraceFile(   "$(DEV1)",	0, "/reg/d/iocData/$(IOC)/logs/$(DEV1).log" )

# Setup autosave
save_restoreSet_status_prefix( "$(IOC)" )
save_restoreSet_IncompleteSetsOk( 1 )
save_restoreSet_DatedBackupFiles( 1 )

set_savefile_path( "$(IOC_DATA)/$(IOC)/autosave" )
set_requestfile_path( "$(TOP)/autosave" )

# Just restore the settings
set_pass0_restoreFile( "$(IOC).sav" )
set_pass1_restoreFile( "$(IOC).sav" )

# Initialize the IOC and start processing records
iocInit()

# Start autosave backups
create_monitor_set( "$(IOC).req", 5, "" )

# All IOCs should dump some common info after initial startup.
< /reg/d/iocCommon/All/post_linux.cmd
