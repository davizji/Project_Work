#!/bin/ksh
# --------------------------------------------------------------------
# Author - Dawid Wrobel
# Description : Automation for Process and NFS Monitoring 
# V=1.1
# Extended Process Monitoring
# --------------------------------------------------------------------
read monitoring?"Provide which monitoring want to set -> (P) - Process Monitoring | (N) - NFS Monitoring :  "
case "$monitoring" in
        "P")
echo "Creating ProcessMonitor extension and stopping agent."
op adma stop
cp -r /home/ue6z1001/scripts_dawid/ProcessMonitor /opt/adma/monitors/
sleep 2
chkprocessmonitor=`ls -ltr /opt/adma/monitors/ | grep ProcessMonitor`
if [[ -n "$chkprocessmonitor"  ]]; then
        echo "ProcessMonitor extension has been created successfully."
        #Backup config.yml
        cp /opt/adma/monitors/ProcessMonitor/config.yml /opt/adma/monitors/ProcessMonitor/config_bkp.yml
		#sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
        #Change Parameters in config.yml
		read mounts?"Please provide how many processes you need to configure - up to 25 : "

case $mounts in
                        "1") #ok
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E) 's/(.*TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "2") #ok #test
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "3")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                         "4")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 3# Process - Display name : "
read PRC_RGX3?"Please enter 3# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                         "5")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "6")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "7")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "8")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "9")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "10")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|' config_test_process2 > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "11")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "12")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "13")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "14")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "15")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "16")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "17")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "18")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "19")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "20")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "21")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
read PRC_DSPL20?"Please enter 21# Process - Display name : "
read PRC_RGX20?"Please enter 21# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|;s|chngdp2|'"$PRC_DSPL20"'|;s|chngrg2|'"$PRC_RGX20"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "22")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
read PRC_DSPL20?"Please enter 21# Process - Display name : "
read PRC_RGX20?"Please enter 21# Process - regex : "
read PRC_DSPL21?"Please enter 22# Process - Display name : "
read PRC_RGX21?"Please enter 22# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|;s|chngdp2|'"$PRC_DSPL20"'|;s|chngrg2|'"$PRC_RGX20"'|;s|chngdp3|'"$PRC_DSPL21"'|;s|chngrg3|'"$PRC_RGX21"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "23")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
read PRC_DSPL20?"Please enter 21# Process - Display name : "
read PRC_RGX20?"Please enter 21# Process - regex : "
read PRC_DSPL21?"Please enter 22# Process - Display name : "
read PRC_RGX21?"Please enter 22# Process - regex : "
read PRC_DSPL22?"Please enter 23# Process - Display name : "
read PRC_RGX22?"Please enter 23# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|;s|chngdp2|'"$PRC_DSPL20"'|;s|chngrg2|'"$PRC_RGX20"'|;s|chngdp3|'"$PRC_DSPL21"'|;s|chngrg3|'"$PRC_RGX21"'|;s|chngdp4|'"$PRC_DSPL22"'|;s|chngrg4|'"$PRC_RGX22"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "24")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
read PRC_DSPL20?"Please enter 21# Process - Display name : "
read PRC_RGX20?"Please enter 21# Process - regex : "
read PRC_DSPL21?"Please enter 22# Process - Display name : "
read PRC_RGX21?"Please enter 22# Process - regex : "
read PRC_DSPL22?"Please enter 23# Process - Display name : "
read PRC_RGX22?"Please enter 23# Process - regex : "
read PRC_DSPL23?"Please enter 24# Process - Display name : "
read PRC_RGX23?"Please enter 24# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|;s|chngdp2|'"$PRC_DSPL20"'|;s|chngrg2|'"$PRC_RGX20"'|;s|chngdp3|'"$PRC_DSPL21"'|;s|chngrg3|'"$PRC_RGX21"'|;s|chngdp4|'"$PRC_DSPL22"'|;s|chngrg4|'"$PRC_RGX22"'|;s|chngdp5|'"$PRC_DSPL23"'|;s|chngrg5|'"$PRC_RGX23"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                       "25")
read PRC_DSPL0?"Please enter 1# Process - Display name : "
read PRC_RGX0?"Please enter 1# Process - regex : "
read PRC_DSPL1?"Please enter 2# Process - Display name : "
read PRC_RGX1?"Please enter 2# Process - regex : "
read PRC_DSPL2?"Please enter 3# Process - Display name : "
read PRC_RGX2?"Please enter 3# Process - regex : "
read PRC_DSPL3?"Please enter 4# Process - Display name : "
read PRC_RGX3?"Please enter 4# Process - regex : "
read PRC_DSPL4?"Please enter 5# Process - Display name : "
read PRC_RGX4?"Please enter 5# Process - regex : "
read PRC_DSPL5?"Please enter 6# Process - Display name : "
read PRC_RGX5?"Please enter 6# Process - regex : "
read PRC_DSPL6?"Please enter 7# Process - Display name : "
read PRC_RGX6?"Please enter 7# Process - regex : "
read PRC_DSPL7?"Please enter 8# Process - Display name : "
read PRC_RGX7?"Please enter 8# Process - regex : "
read PRC_DSPL8?"Please enter 9# Process - Display name : "
read PRC_RGX8?"Please enter 9# Process - regex : "
read PRC_DSPL9?"Please enter 10# Process - Display name : "
read PRC_RGX9?"Please enter 10# Process - regex : "
read PRC_DSPL10?"Please enter 11# Process - Display name : "
read PRC_RGX10?"Please enter 11# Process - regex : "
read PRC_DSPL11?"Please enter 12# Process - Display name : "
read PRC_RGX11?"Please enter 12# Process - regex : "
read PRC_DSPL12?"Please enter 13# Process - Display name : "
read PRC_RGX12?"Please enter 13# Process - regex : "
read PRC_DSPL13?"Please enter 14# Process - Display name : "
read PRC_RGX13?"Please enter 14# Process - regex : "
read PRC_DSPL14?"Please enter 15# Process - Display name : "
read PRC_RGX14?"Please enter 15# Process - regex : "
read PRC_DSPL15?"Please enter 16# Process - Display name : "
read PRC_RGX15?"Please enter 16# Process - regex : "
read PRC_DSPL16?"Please enter 17# Process - Display name : "
read PRC_RGX16?"Please enter 17# Process - regex : "
read PRC_DSPL17?"Please enter 18# Process - Display name : "
read PRC_RGX17?"Please enter 18# Process - regex : "
read PRC_DSPL18?"Please enter 19# Process - Display name : "
read PRC_RGX18?"Please enter 19# Process - regex : "
read PRC_DSPL19?"Please enter 20# Process - Display name : "
read PRC_RGX19?"Please enter 20# Process - regex : "
read PRC_DSPL20?"Please enter 21# Process - Display name : "
read PRC_RGX20?"Please enter 21# Process - regex : "
read PRC_DSPL21?"Please enter 22# Process - Display name : "
read PRC_RGX21?"Please enter 22# Process - regex : "
read PRC_DSPL22?"Please enter 23# Process - Display name : "
read PRC_RGX22?"Please enter 23# Process - regex : "
read PRC_DSPL23?"Please enter 24# Process - Display name : "
read PRC_RGX23?"Please enter 24# Process - regex : "
read PRC_DSPL24?"Please enter 25# Process - Display name : "
read PRC_RGX24?"Please enter 25# Process - regex : "
sed -e 's|changedsp0|'"$PRC_DSPL0"'|;s|changereg0|'"$PRC_RGX0"'|;s|changedsp1|'"$PRC_DSPL1"'|;s|changereg1|'"$PRC_RGX1"'|;s|changedsp2|'"$PRC_DSPL2"'|;s|changereg2|'"$PRC_RGX2"'|;s|changedsp3|'"$PRC_DSPL3"'|;s|changereg3|'"$PRC_RGX3"'|;s|changedsp4|'"$PRC_DSPL4"'|;s|changereg4|'"$PRC_RGX4"'|;s|changedsp5|'"$PRC_DSPL5"'|;s|changereg5|'"$PRC_RGX5"'|;s|changedsp6|'"$PRC_DSPL6"'|;s|changereg6|'"$PRC_RGX6"'|;s|changedsp7|'"$PRC_DSPL7"'|;s|changereg7|'"$PRC_RGX7"'|;s|changedsp8|'"$PRC_DSPL8"'|;s|changereg8|'"$PRC_RGX8"'|;s|changedsp9|'"$PRC_DSPL9"'|;s|changereg9|'"$PRC_RGX9"'|;s|chngdsp1|'"$PRC_DSPL10"'|;s|chngreg1|'"$PRC_RGX10"'|;s|chngdsp2|'"$PRC_DSPL11"'|;s|chngreg2|'"$PRC_RGX11"'|;s|chngdsp3|'"$PRC_DSPL12"'|;s|chngreg3|'"$PRC_RGX12"'|;s|chngdsp4|'"$PRC_DSPL13"'|;s|chngreg4|'"$PRC_RGX13"'|;s|chngdsp5|'"$PRC_DSPL14"'|;s|chngreg5|'"$PRC_RGX14"'|;s|chngdsp6|'"$PRC_DSPL15"'|;s|chngreg6|'"$PRC_RGX15"'|;s|chngdsp7|'"$PRC_DSPL16"'|;s|chngreg7|'"$PRC_RGX16"'|;s|chngdsp8|'"$PRC_DSPL17"'|;s|chngreg8|'"$PRC_RGX17"'|;s|chngdsp9|'"$PRC_DSPL18"'|;s|chngreg9|'"$PRC_RGX18"'|;s|chngdp1|'"$PRC_DSPL19"'|;s|chngrg1|'"$PRC_RGX19"'|;s|chngdp2|'"$PRC_DSPL20"'|;s|chngrg2|'"$PRC_RGX20"'|;s|chngdp3|'"$PRC_DSPL21"'|;s|chngrg3|'"$PRC_RGX21"'|;s|chngdp4|'"$PRC_DSPL22"'|;s|chngrg4|'"$PRC_RGX22"'|;s|chngdp5|'"$PRC_DSPL23"'|;s|chngrg5|'"$PRC_RGX23"'|;s|chngdp6|'"$PRC_DSPL24"'|;s|chngrg6|'"$PRC_RGX24"'|' config_test_process2 > cfg
grep -v chng cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TEMPLATE(.*)/echo "\1$(cat cfg_finished)\2"/e' config_template.yml > cfg.yml
mv cfg.yml /opt/adma/monitors/ProcessMonitor/config.yml
chmod 750 /opt/adma/monitors/ProcessMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                         *) echo "Please choose number from 1 to 25. "
						 

esac
        #AppD Agent stop
        sleep 2
        #AppD Agent start with changing parameter
        op adma start

else
        echo "ProcessMonitor extension NOT created. Please investigate manually."
        exit
fi
		;;
        "N")
echo "Creating LinuxMonitor extension"
# chckversion=`yum info adma | grep Version | grep 4. | grep -v Summary | grep -v Description | awk '{print$3}'`
# if [[ -n "$chckversion"  ]]; then
cp -r /home/ue6z1001/LinuxMonitor /opt/adma/monitors/
op adma stop
sleep 2
#Check if /opt/adma/monitors/LinuxMonitor is created
chklnxmonitor=`ls -ltr /opt/adma/monitors/ | grep LinuxMonitor`
if [[ -n "$chklnxmonitor"  ]]; then
        echo "LinuxMonitor extension has been created successfully. Now modifing metrics.xml and config.yml"
                #Modify metrics.xml
        cp /opt/adma/monitors/LinuxMonitor/metrics.xml /opt/adma/monitors/LinuxMonitor/metrics_bkp.xml
        cp /home/ue6z1001/metrics.xml /opt/adma/monitors/LinuxMonitor/		#PODMIANKA NA TST
                #Backup config.yml
        mv /opt/adma/monitors/LinuxMonitor/config.yml /opt/adma/monitors/LinuxMonitor/config_bkp.yml
                                #Change Parameters in config.yml
                                                                read mounts?"Please provide how many mounts you need to configure - up to 10 : "

case $mounts in
                        "1") #ok
read MNT0?"Please enter 1# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
rm cfg cfg_done cfg_finished
;;
                        "2") #ok #test
read MNT0?"Please enter 1# NFS Mount: "
read MNT1?"Please enter 2# NFS Mount: "
sed -e 's|change0|'"$MNT0"'|;s|change1|'"$MNT1"'|' config_test > cfg
grep -v change cfg > cfg_done
grep -v '^[[:space:]]*$' cfg_done > cfg_finished
sed -E 's/(.*)TO_CHANGE(.*)/echo "\1$(cat cfg_finished)\2"/e' config.yml_sample > cfg.yml
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
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
mv cfg.yml /opt/adma/monitors/LinuxMonitor/config.yml
chmod 750 /opt/adma/monitors/LinuxMonitor/config.yml
rm cfg cfg_done cfg_finished
;;

                        *) echo "Please choose number from 1 to 10. "

esac
        #AppD Agent start with changing parameter
        op adma start -Dappdynamics.agent.maxMetrics=2000
else
        echo "LinuxMonitor extension NOT created. Please investigate manually."
        exit
fi
        ;;
        *)
        echo "------------------------------"
        echo "Please choose P or N option."
        echo "------------------------------"
esac
