#!/bin/ksh
read check?"Please verify config.yml file if correct NFS Mounts are included to this file. If you sure press (Y) : "
case "$check" in
        "Y")
echo "Creating ProcessMonitor extension and stopping agent."
op adma ext ProcessMonitor enable
op adma stop
sleep 2
#Check if /opt/adma/monitors/ProcessMonitor is created
chklnxmonitor=`ls -ltr /opt/adma/monitors/ | grep ProcessMonitor`
if [[ -n "$chklnxmonitor"  ]]; then
        echo "ProcessMonitor extension has been created successfully. Now modifing metrics.xml and config.yml"
                #Modify metrics.xml
        cp /opt/adma/monitors/ProcessMonitor/metrics.xml /opt/adma/monitors/ProcessMonitor/metrics_bkp.xml
        cp /home/ue6z1001/scripts_dawid/metrics.xml /opt/adma/monitors/ProcessMonitor/
                #Backup config.yml
        mv /opt/adma/monitors/ProcessMonitor/config.yml /opt/adma/monitors/ProcessMonitor/config_bkp.yml
                #Change Parameters in config.yml
        cp /home/ue6z1001/scripts_dawid/config.yml /opt/adma/monitors/ProcessMonitor/
        # mv /opt/adma/monitors/ProcessMonitor/config_HKG.yml /opt/adma/monitors/ProcessMonitor/config.yml
                #AppD Agent stop
        sleep 2
                #AppD Agent start with changing parameter
        op adma start -Dappdynamics.agent.maxMetrics=2000
else
        echo "ProcessMonitor extension NOT created. Please investigate manually."
        exit
fi
        ;;
        *)
        echo "------------------------------"
        echo "Please correct config.yml file"
        echo "------------------------------"
esac
