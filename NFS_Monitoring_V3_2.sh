#!/bin/ksh
#read check?"Please verify config.yml file ...if correct NFS Mounts are included to this file. If you sure we can preceed... Press A to include changeparams appname. Press I to proceed without changeparams appname"
read check?"Please verify config.yml file ... Press A to set NFS + change appname, Press I to set NFS, Press N to exit."
case "$check" in
        "A")
read appn?"Provide appname : "
op adma changeparams appname $appn
echo "Creating ProcessMonitor extension"
cp -R /home/ue6z1001/ProcessMonitor /opt/adma/monitors/ProcessMonitor/
op adma stop
sleep 2
#Check if /opt/adma/monitors/ProcessMonitor is created
chklnxmonitor=`ls -ltr /opt/adma/monitors/ | grep ProcessMonitor`
if [[ -n "$chklnxmonitor"  ]]; then
        echo "ProcessMonitor extension has been created successfully. Now modifing metrics.xml and config.yml"
                #Modify metrics.xml
        cp /opt/adma/monitors/ProcessMonitor/metrics.xml /opt/adma/monitors/ProcessMonitor/metrics_bkp.xml
        cp /home/ue6z1001/metrics.xml /opt/adma/monitors/ProcessMonitor/ #PODMIANKA NA TST
                #Backup config.yml
        mv /opt/adma/monitors/ProcessMonitor/config.yml /opt/adma/monitors/ProcessMonitor/config_bkp.yml
                                #Change Parameters in config.yml
                                read mounts?"Please provide how many mounts you need to configure - up to 10 : "

case $mounts in
                        "1") #ok
read MNT0?"Please enter 1# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "2") #ok #test
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "3")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "4")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "5")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "6")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "7")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "8")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "9")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
read MNT8?"Please enter 9# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|;s|change8|'"$MNT8"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "10")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
read MNT8?"Please enter 9# NFS Mount: "
read MNT9?"Please enter 10# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|;s|change8|'"$MNT8"'|;s|change9|'"$MNT9"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;

                        *) echo "Please choose number from 1 to 9. "
esac

                #AppD Agent start with changing parameter
        op adma start -Dappdynamics.agent.maxMetrics=2000
else
        echo "ProcessMonitor extension NOT created. Please investigate manually."
        exit
fi
        ;;
        "I")
echo "Creating ProcessMonitor extension"
cp -R /home/ue6z1001/ProcessMonitor /opt/adma/monitors/ProcessMonitor/
op adma stop
sleep 2
#Check if /opt/adma/monitors/ProcessMonitor is created
chklnxmonitor=`ls -ltr /opt/adma/monitors/ | grep ProcessMonitor`
if [[ -n "$chklnxmonitor"  ]]; then
        echo "ProcessMonitor extension has been created successfully. Now modifing metrics.xml and config.yml"
                #Modify metrics.xml
        cp /opt/adma/monitors/ProcessMonitor/metrics.xml /opt/adma/monitors/ProcessMonitor/metrics_bkp.xml
        cp /home/ue6z1001/metrics.xml /opt/adma/monitors/ProcessMonitor/		#PODMIANKA NA TST
                #Backup config.yml
        mv /opt/adma/monitors/ProcessMonitor/config.yml /opt/adma/monitors/ProcessMonitor/config_bkp.yml
                                #Change Parameters in config.yml
                                                                read mounts?"Please provide how many mounts you need to configure - up to 10 : "

case $mounts in
                        "1") #ok
read MNT0?"Please enter 1# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "2") #ok #test
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "3")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "4")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "5")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "6")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "7")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "8")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "9")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
read MNT8?"Please enter 9# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|;s|change8|'"$MNT8"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "10")
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
read MNT2?"Please enter 3# NFS Mount: "
read MNT3?"Please enter 4# NFS Mount: "
read MNT4?"Please enter 5# NFS Mount: "
read MNT5?"Please enter 6# NFS Mount: "
read MNT6?"Please enter 7# NFS Mount: "
read MNT7?"Please enter 8# NFS Mount: "
read MNT8?"Please enter 9# NFS Mount: "
read MNT9?"Please enter 10# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|;s|change2|'"$MNT2"'|;s|change3|'"$MNT3"'|;s|change4|'"$MNT4"'|;s|change5|'"$MNT5"'|;s|change6|'"$MNT6"'|;s|change7|'"$MNT7"'|;s|change8|'"$MNT8"'|;s|change9|'"$MNT9"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;

                        *) echo "Please choose number from 1 to 9. "
esac
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
