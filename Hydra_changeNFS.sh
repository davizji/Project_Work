#!/bin/ksh
changefs(){
echo "Stoping agent .. "
op adma stop
echo "Changing filesystem .. "
read fs?"Please provide pathname :"

sed -i "s#fileSystem: \"/sbclocal/data\"#fileSystem: \"$fs\"#" /opt/adma/monitors/ProcessMonitor/config.yml
echo "Starting agent .. "
op adma start
}
changefs

#op adma start

#Variables aren't expanded inside single quotes. 
#Replace the single quotes (') by double quotes (") and then escape the double quotes (") inside the string using (\")

