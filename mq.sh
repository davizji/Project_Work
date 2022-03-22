#!/bin/ksh
#checking if root or mqm user is on MQ agents#
#tacmd executecommand -m can_pa12lsrv0595svc1a:KUX -c '/bin/su - mqm -c "/opt/IBM/ITM/bin/itmcmd agent -o CANMQDL -f stop mq;/opt/IBM/ITM/bin/itmcmd agent -o MQUAT010 start mq;"' -v -o -e#

BASEALL="/users/wrobed/is4all"


generate_raport()
{
tacmd listsystems > $BASEALL
}

gathermq()
{
for i in $BASEALL
do
mqagents=`grep ' MQ ' $i | cut -d":" -f2 | sort -nr ` 
osagents=`grep "$mqagents" $i | egrep " LZ | UX" | awk '{print$1}'`
#echo "$osagents"
#rootormq=`tx $osagents $cinfo | grep ' mq '`  
done
}

gathercinfo()
{
for o in $osagents
do
rootormq=`tx $o /opt/IBM/ITM/bin/cinfo -r | grep ' mq ' | grep -v 'None' | sort -n`
#echo "$rootormq"
checkroot=`tx $o /opt/IBM/ITM/bin/cinfo -r | grep ' mq ' | grep -v 'None' | sort -n | awk '{print$4}'`
if [[ "$checkroot" == "root" ]];
then
instance=`tx $o /opt/IBM/ITM/bin/cinfo -r | grep ' mq ' | grep -v 'None' | sort -n | awk '{print$6}'`
tacmd executecommand -m $o -c '/bin/su - mqm -c "/opt/IBM/ITM/bin/itmcmd agent -o $instance -f stop mq;/opt/IBM/ITM/bin/itmcmd agent -o $instance start mq;"' -v -o -e
fi
done
}

generate_raport
gathermq
gathercinfo