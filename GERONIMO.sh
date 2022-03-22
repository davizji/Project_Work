#!/bin/ksh
echo "Checking if agents are in servers " 
chklnxmonitor=`ls -ltr /opt/| grep adma`
if [[ -n "$chklnxmonitor"  ]]; then
	echo "File exist. please check manually."
	exit
else 
	echo "File is not existing. Processing installation machine and app agents : "
		ver=`cat /etc/redhat-release`
		if [[ "$ver" =~ .*6..*  ]];
		then
		echo "IT IS RHEL6 CAN PROCESSING:"
		./install_machine_agent_RHEL6.sh
		./install_app_agent_RHEL6.sh
		./machine_agent_loggin.sh

		else
		echo "ITS NOT RHEL6"
		if [[ "$ver" =~ .*7..*  ]];
		then
		echo "IT IS RHEL7 CAN PROCESSING:"
		./install_machine_agent_RHEL7.sh
		./install_app_agent_RHEL7.sh
		./machine_agent_loggin.sh
		else
		echo "IT IS NOT RHEL6 EITHER RHEL7, stop"
		exit
		fi
		fi
fi
