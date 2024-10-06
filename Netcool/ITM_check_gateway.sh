#!/bin/ksh

###check GW on NT Agent###

#echo "Please provide Agent to which you can check IP GW"

read agent?"Please provide Agent to which you can check GW (NT|06|LZ|08|MQ) : "
read host?"Please provide full server name with agent : "

case $agent in
        "NT") tacmd executecommand -m $host -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\KNT\Ver610\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}' ;;
        "06") tacmd executecommand -m $host -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\K06\Ver622\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}' ;;
        "LZ") tx $host cat /opt/IBM/ITM/config/lz.config | grep CT_CMSLIST | awk '{print $2}' ;;
        "08") tx $host cat /opt/IBM/ITM/config/08.config | grep CT_CMSLIST | awk '{print $2}' ;;
        "MQ") tx $host cat /opt/IBM/ITM/config/mq.config | grep CT_CMSLIST | awk '{print $2}' ;;
        *) echo "You choose bad Agent name"
esac
