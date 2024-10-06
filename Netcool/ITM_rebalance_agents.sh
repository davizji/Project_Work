#!/bin/bash
#PING_SCRIPT AGENT REBALANCE
#Belfius

bel="/users/wrobed/scripts/ping_rebalance/Belfius"
allsrv="/users/wrobed/is4fall"
PROBLEM="/users/wrobed/scripts/ping_rebalance/Belfius_cannotbalance"
PROBLEMLX="/users/wrobed/scripts/ping_rebalance/Belfius_cannotbalanceLX"
LOGSDEPLOYSTATUS="/users/wrobed/scripts/ping_rebalance/LOGS_FROM_DEPLOYSTATUS"
LOGSDEPLOYSTATUSLX="/users/wrobed/scripts/ping_rebalance/LOGS_FROM_DEPLOYSTATUSLX"
CHECKEDOKWINBEL="/users/wrobed/scripts/ping_rebalance/CHK_OK_WIN_BEL"
CHECKEDNOKWINBEL="/users/wrobed/scripts/ping_rebalance/CHK_NOK_WIN_BEL"
chgcust="/users/wrobed/scripts/ping_rebalance/chg_customer.txt"
BASEALL="/users/wrobed/is4fall_new"
CHECKEDOKLXBEL="/users/wrobed/scripts/ping_rebalance/CHK_OK_LX_BEL"
CHECKEDNOKLXBEL="/users/wrobed/scripts/ping_rebalance/CHK_NOK_LX_BEL"
OUTPUTRESTLXBEL="/users/wrobed/scripts/ping_rebalance/REST_LX"


dcmlst=`cat /users/wrobed/scripts/ping_rebalance/chg_customer.txt`

generate_report()
{
tacmd listsystems > $BASEALL
}

WINDOWSBEL()
{
for i in $bel
do
winbel=`grep xw10 $bel`
for o in $winbel
do
#echo $o
winbelfull=`grep $o $allsrv | grep ' NT ' | awk '{print$1}'`

testconnwin=`tacmd executecommand -m $winbelfull -c "powershell \"Test-NetConnection 0.1.2.3 -Port 3660\" " -v -o -e -r | grep TcpTestSucceeded`
#echo $testconnwin | grep -c True
if [ `echo $testconnwin | grep -c True` -gt "0" ];
then
echo "Server $o can be transferred to Belfius RTEMS"
echo "---------------------------------------------"
echo "PROCESSING : "
setconn=`tacmd setagentconnection -n $winbelfull -f -t all -e CT_CMSLIST='ip.spipe:#0.1.2.3;ip.spipe:#0.1.2.4 '`
echo $setconn
echo $setconn >> $LOGSDEPLOYSTATUS
else
echo "Server $o can NOT be transferred" 
echo "Server $o can NOT be transferred" >> $PROBLEM
fi
done
done
}

WINBELCHECK()
{
for i in $bel
do
winbel=`grep xw10 $bel`
for o in $winbel
do
echo "Server $o connected to :"
#./listOS_new.sh -e
connrtems=`/users/wrobed/scripts/listOS_new.sh -e $o | grep RTEMS`
echo $connrtems
if [ `echo $connrtems | grep -c REMOTE_1` -gt "0" ];
then
echo "Server $o correct connected"
echo "Server $o correct connected TO BELFIUS SEGREGATED RTEMS" >> $CHECKEDOKWINBEL
else
echo "PROBLEM WITH - Server $o . Still connected to bad RTEMS"
echo "PROBLEM WITH - Server $o . Still connected to bad RTEMS" >> $CHECKEDNOKWINBEL
fi
done
done
}

WINSETAGENT()
{
for i in $chgcust
do
#grep bel_ $i
srvchgcus=`cat $i | cut -d"_" -f2`
for o in $srvchgcus
do
echo " Server $o changing customer code from bel_ to can_  "
readysrv=`grep $o $allsrv | egrep ' LZ | NT ' | awk '{print$1}'`
#echo $readysrv
tacmd setagentconnection -n $readysrv -f -a -e CTIRA_HOSTNAME=can_$o CTIRA_SYSTEM_NAME=can_$o
done
done
}

WINDOWSREST()
{
for i in $PROBLEM
do
winbelrest=`cat $i | awk '{print$2}'`
for o in "$winbelrest"
do
echo $o

done
done
}

LNXBEL()
{
for i in $bel
do
lxbel=`grep xl10 $bel`
for o in $lxbel
do
#echo $o
lxbelfull=`grep $o $allsrv | grep ' LZ ' | awk '{print$1}'`
#echo $lxbelfull
# tx server:agent 'telnet IP PORT'
testconnlx=`tx $lxbelfull 'telnet 0.1.2.4 3660'`
if [ `echo $testconnlx | grep -c Connected` -gt "0" ];
then
echo "Server $o can be transferred to Belfius RTEMS"
echo "---------------------------------------------"
echo "PROCESSING : "
setconnlx=`tacmd setagentconnection -n $lxbelfull -f -t all -e CT_CMSLIST='ip.spipe:#0.1.2.4;ip.spipe:#0.1.2.5 '`
echo $setconnlx
echo $setconnlx >> $LOGSDEPLOYSTATUSLX
else
echo "Server $o can NOT be transferred" 
echo "Server $o can NOT be transferred" >> $PROBLEMLX
fi
done
done
}

LNXREST()
{
for i in $PROBLEMLX
do
lxrest=`awk '{print$2}' $i`
for o in $lxrest
do
#echo $o
lxbelfullrest=`grep $o $allsrv | grep ' LZ ' | awk '{print$1}'`
#echo $lxbelfullrest
# tx server:agent 'telnet IP PORT'
setconnlxrest=`tacmd setagentconnection -n $lxbelfullrest -f -t all -e CT_CMSLIST='ip.spipe:#0.1.2.4;ip.spipe:#0.1.2.5 '`
echo $setconnlxrest
echo $setconnlxrest > $OUTPUTRESTLXBEL

done
done
}

echo ' Please enter your choice: '
options=("Windows Belfius rebalance ITM Agents" "Windows Belfius Check" "Windows Belfius change hostname" "Windows Belfius rest offline rebalance" "Linux Belfius rebalance ITM Agents" "Rest LX Bel" "QUIT")
select opt in "${options[@]}"
do
	case $opt in
		"Windows Belfius rebalance ITM Agents")
			WINDOWSBEL
			;;
		"Windows Belfius Check")
			WINBELCHECK
			;;
		"Windows Belfius change hostname")
			WINSETAGENT
			break
			;;
		"Windows Belfius rest offline rebalance")
			WINDOWSREST
			break
			;;			
		"Linux Belfius rebalance ITM Agents")
		#	generate_report
			LNXBEL
			;;
		"Rest LX Bel")
		#	generate_report
			LNXREST
			;;
		"QUIT")
			break
			;;
		*) echo "Invalid option $REPLY";;
	esac
done

# if [ "$1" = "-check" ]; then
# WINBELCHECK
# fi

# if [ "$1" = "-winbel" ]; then
# WINDOWS
# fi
