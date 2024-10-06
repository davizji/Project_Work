#!/bin/bash
#WINDOWS NOT ALL HAVE BOTH OF AGENTS#
#NT      78        4030       98.06%
#06      83        3533       97.65%

BASEALL="/users/wrobed/is4all"
#listoffsv=`cat ITMReport_2020-10-21.xls`
PROBLEM="/users/wrobed/scripts/WinReport/Problems_start_agents.txt"
lastlog="/users/wrobed/scripts/WinReport/logs_fromserver.txt"
perflib_log="/users/wrobed/scripts/WinReport/perflib_log"
logs_windows="C:\PROGRA~1\IBM\ITM\tmaitm6_x64\logs"
config_server="C:\PROGRA~1\IBM\ITM\TMAITM~1\KNTENV"
kntenv="/users/wrobed/scripts/KNTENV"
catchedperf="/users/wrobed/scripts/pefromcounters"


generate_report()
{
./winrepv3.sh
#listoffsv=`cat ITMReport_2020-10-25.xls`
listoffsv=`cat ITMReport.xls`
mv Problems_start_agents.txt Problems_start_agents_OLD.txt
}

getsvrs()
{
for i in $BASEALL
do
gsmaagents=`grep "$listoffsv" "$i" | grep ' Y ' | grep ' 06 ' | grep -v srv1 | grep -v srv2 `
echo "$gsmaagents"
osagents=`grep "$listoffsv" "$i" | grep ' Y ' | grep ' NT ' | grep -v srv3`
echo "$osagents"
for o in "$gsmaagents"
do
cuttedgsma=`echo "$o" | awk '{print$1}'`
done
for u in "$osagents"
do
cuttedos=`echo "$u" | awk '{print$1}' | grep -v ldca`
done
done
}

startagentsOS()
{
for i in $cuttedgsma
do
echo "                              "
echo "                              "
echo "INVESTIGATION ON SERVER : $i "
echo "- - - - - - - - - - - - - - -"
trystart=`tx "$i" net start kntcma_primary`
 if [[ $trystart =~ .*already.* ]];
  then
                echo "---------------------------------------------"
        echo "Agent already started on $i, but Offline. Need to check GW."
                echo "---------------------------------------------"
        echo "CHECKING GW :"
                echo "---------------------------------------------"
        getGW=`tacmd executecommand -m $i -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\K06\Ver622\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}'`
        echo "$getGW - GW is transsfered to OS Agents."
        echo "GW is transfered to KNTENV file."
                transferkntenv=`tx $i "echo CT_CMSLIST=$getGW >> C:\PROGRA~1\IBM\ITM\TMAITM~1\KNTENV"`
                echo "GW is transfered to kntcma.ini file."
        transferknctcma=`tx $i "echo CT_CMSLIST=$getGW  >> C:\PROGRA~1\IBM\ITM\TMAITM~1\kntcma.ini"`
                echo "GW is transfered to REGISTRY."
        transferregistry=`tacmd executecommand -m $i -c "REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Candle\KNT\Ver610\Primary\Environment /v CT_CMSLIST /d $getGW /f" -v -o -e`
                echo "RESTARTING NT AGENT."
        stopnt=`tx $i 'net stop kntcma_primary'`
        startnt=`tx $i 'net start kntcma_primary'`
        svwithoutagent=`echo "$i" | cut -d":" -f1`
        checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
#echo "$checkifonline" | grep ' NT ' | awk '{print$4}'
        if [[ `echo "$checkifonline" | grep ' NT ' | awk '{print$4}' `  == "Y" ]];
        then
                echo "---------------------------------------------"
        echo "--SUCCESS !!--"
        echo "OS AGENT on server -- $svwithoutagent -- UP AND RUNNING"
                echo "---------------------------------------------"
        else
                echo "---------------------------------------------"
        echo "SOMETHING STILL IS BAD, download logs"
                echo "PROBLEM WITH OS AGENT $svwithoutagent" >> $PROBLEM
		lastlog=`tx $svwithoutagent:06 'dir \0D "C:\PROGRA~1\IBM\ITM\tmaitm6_x64\logs"' | grep kntcma_ | sed '$!d' | awk '{print$4}'`
		gtfile=`tacmd getfile -s $logs_windows'\'$lastlog -d $perflib_log -f -m $svwithoutagent:06`
		if [[ `echo $gtfile` = *"successfully"* ]]; then
		echo "Log downloaded"
		lastlogagent=`sed '$!d' $perflib_log`
			if [[ $lastlogagent = *"Perfmon"* ]]; then
			echo "Problem with Perfmon COUNTER'S, KNTENV file DOWNLOAD and repairing"
			tacmd getfile -s $config_server -d $kntenv -f -m $svwithoutagent:06
			echo "Get counters and change KNTENV file"
			tail -20 $perflib_log | grep counter | cut -d"'" -f2 > $catchedperf
			prepared=`sed 's/$/,/' $catchedperf`
			prefinallyfinally=`echo $prepared | sed 's/\,[[:blank:]]/,/g'`
			finally=`echo $prefinallyfinally | sed 's/.$//'`
			echo 'NT_EXCLUDE_PERF_OBJS='$finally >> $kntenv
			putkntenv=`tacmd putfile -s $kntenv -d $config_server -f -m $svwithoutagent:06`
			echo 'Restart OS Agent'
			lodctr=`tx $svwithoutagent:06 'lodctr /R' | grep successfully`
			echo "lodctr /R used : "
			echo $lodctr
			stop=`tx $svwithoutagent:06 'net stop kntcma_primary' | grep stopped`
			echo $stop
			start=`tx $svwithoutagent:06 'net start kntcma_primary' | grep started`
			echo $start
			tms | grep $svwithoutagent
			else
			echo "Problem with something different."
		fi
		else
		echo "Something is bad! Please check if this server have correct path of CANDLEHOME"
		exit
		fi
         echo "PROBLEM WITH OS AGENT $svwithoutagent" >> $PROBLEM
        #exit
        fi
        #exit
    fi
else
echo "---------------------------------------------"
echo "OS Agent on this server $i restarted"
echo "---------------------------------------------"
svwithoutagent=`echo "$i" | cut -d":" -f1`
checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
#echo "$checkifonline" | grep ' NT ' | awk '{print$4}'
if [[ `echo "$checkifonline" | grep ' NT ' | awk '{print$4}' `  == "Y" ]];
then
echo "---------------------------------------------"
echo "--SUCCESS !!--"
echo "OS AGENT on server -- $svwithoutagent -- UP AND RUNNING"
echo "---------------------------------------------"
else
echo "---------------------------------------------"
echo "SOMETHING IS BAD, NEED INVESTIGATION with server $svwithoutagent"
echo "TRYING TO REPAIR OS AGENT : "
echo "CHECKING GW :"
        getGW=`tacmd executecommand -m $i -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\K06\Ver622\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}'`
        echo "$getGW - GW is transsfered to OS Agents."
                echo "GW is transfered to KNTENV file."
        transferkntenvdwa=`tx $i "echo CT_CMSLIST=$getGW >> C:\PROGRA~1\IBM\ITM\TMAITM~1\KNTENV"`
                echo "GW is transfered to KNTCMA file."
        transferknctcmadwa=`tx $i "echo CT_CMSLIST=$getGW  >> C:\PROGRA~1\IBM\ITM\TMAITM~1\kntcma.ini"`
                echo "GW is transfered to REGISTRY."
        transferregistrydwa=`tacmd executecommand -m $i -c "REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Candle\KNT\Ver610\Primary\Environment /v CT_CMSLIST /d $getGW /f" -v -o -e`
                echo "RESTARTING NT AGENT."
        stopagentdwa=`tx $i 'net stop kntcma_primary'`
        startagentdwa=`tx $i 'net start kntcma_primary'`
        svwithoutagent=`echo "$i" | cut -d":" -f1`
        checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
        #echo "$checkifonline" | grep ' 06 ' | awk '{print$4}'
        if [[ `echo "$checkifonline" | grep ' NT ' | awk '{print$4}' `  == "Y" ]];
        then
        echo "--SUCCESS !!--"
        echo "GSMA AGENT on server -- $svwithoutagent -- UP AND RUNNING"
        else
                echo "---------------------------------------------"
        echo "SOMETHING STILL IS BAD, download logs : "
		lastlog=`tx $svwithoutagent:06 'dir \0D "C:\PROGRA~1\IBM\ITM\tmaitm6_x64\logs"' | grep kntcma_ | sed '$!d' | awk '{print$4}'`
		gtfile=`tacmd getfile -s $logs_windows'\'$lastlog -d $perflib_log -f -m $svwithoutagent:06`
		if [[ `echo $gtfile` = *"successfully"* ]]; then
		echo "Log downloaded"
		lastlogagent=`sed '$!d' $perflib_log`
			if [[ $lastlogagent = *"Perfmon"* ]]; then
			echo "Problem with Perfmon COUNTER'S, KNTENV file DOWNLOAD and repairing"
			tacmd getfile -s $config_server -d $kntenv -f -m $svwithoutagent:06
			echo "Get counters and change KNTENV file"
			tail -20 $perflib_log | grep counter | cut -d"'" -f2 > $catchedperf
			prepared=`sed 's/$/,/' $catchedperf`
			prefinallyfinally=`echo $prepared | sed 's/\,[[:blank:]]/,/g'`
			finally=`echo $prefinallyfinally | sed 's/.$//'`
			echo 'NT_EXCLUDE_PERF_OBJS='$finally >> $kntenv
			putkntenv=`tacmd putfile -s $kntenv -d $config_server -f -m $svwithoutagent:06`
			echo 'Restart OS Agent'
			lodctr=`tx $svwithoutagent:06 'lodctr /R' | grep successfully`
			echo "lodctr /R used : "
			echo $lodctr
			stop=`tx $svwithoutagent:06 'net stop kntcma_primary' | grep stopped`
			echo $stop
			start=`tx $svwithoutagent:06 'net start kntcma_primary' | grep started`
			echo $start
			tms | grep $svwithoutagent
			else
			echo "Problem with something different."
		fi
		else
		echo "Something is bad! Please check if this server have correct path of CANDLEHOME"
		exit
		fi
         echo "PROBLEM WITH OS AGENT $svwithoutagent" >> $PROBLEM
        #exit
        fi
fi
fi
done
}

startagentsGSMA()
{
for i in $cuttedos
do
echo "                              "
echo "                              "
echo "INVESTIGATION ON SERVER : $i "
echo "- - - - - - - - - - - - - - -"
trystart=`tx "$i" net start k06cma`
 if [[ $trystart =~ .*already.* ]];
  then
        echo "Agent already started on $i, but Offline. Need to check GW."
        echo "CHECKING GW :"
        getGW=`tacmd executecommand -m $i -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\KNT\Ver610\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}'`
        echo "$getGW - GW is transfered to GSMA Agents."
                echo "GW is transfered to K06ENV file."
        transfergsma=`tx $i "echo CT_CMSLIST=$getGW >> C:\PROGRA~1\IBM\ITM\TMAITM~1\K06ENV"`
                echo "GW is transfered to k06cma file."
        transfergsmacma=`tx $i "echo CT_CMSLIST=$getGW  >> C:\PROGRA~1\IBM\ITM\TMAITM~1\k06cma.ini"`
                echo "GW is transfered to REGISTRY."
        transferregistrygsma=`tacmd executecommand -m $i -c "REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Candle\K06\Ver622\Primary\Environment /v CT_CMSLIST /d $getGW /f" -v -o -e`
                echo "RESTART GSMA AGENT :"
        stopgsma=`tx $i 'net stop k06cma'`
        startgsma=`tx $i 'net start k06cma'`
        svwithoutagent=`echo "$i" | cut -d":" -f1`
        checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
#echo "$checkifonline" | grep ' NT ' | awk '{print$4}'
                if [[ `echo "$checkifonline" | grep ' 06 ' | awk '{print$4}' `  == "Y" ]];
                then
                            echo "--SUCCESS !!--"
                echo "GSMA AGENT on server -- $svwithoutagent -- UP AND RUNNING"
                else
                echo "SOMETHING STILL IS BAD, NEED INVESTIGATION with server $svwithoutagent"
                                echo "PROBLEM WITH GSMA AGENT $svwithoutagent" >> $PROBLEM
                #exit
                fi
else
echo "---------------------------------------------"
echo "GSMA Agent on this server $i restarted"
echo "---------------------------------------------"
svwithoutagent=`echo "$i" | cut -d":" -f1`
checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
#echo "$checkifonline" | grep ' 06 ' | awk '{print$4}'
if [[ `echo "$checkifonline" | grep ' 06 ' | awk '{print$4}' `  == "Y" ]];
then
echo "---------------------------------------------"
echo "--SUCCESS !!--"
echo "GSMA AGENT on server -- $svwithoutagent -- UP AND RUNNING"
echo "---------------------------------------------"
else
echo "SOMETHING IS BAD, NEED INVESTIGATION with server $svwithoutagent"
echo "TRYING TO REPAIR GSMA AGENT : "
echo "CHECKING GW :"
        getGW=`tacmd executecommand -m $i -c "REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Candle\KNT\Ver610\Primary\Environment" -v -o -e | grep CT_CMSLIST | awk '{print $3}'`
        echo "$getGW - GW is transsfered to GSMA Agents."
                echo "GW is transfered to K06ENV file."
        transfergsmadwa=`tx $i "echo CT_CMSLIST=$getGW >> C:\PROGRA~1\IBM\ITM\TMAITM~1\K06ENV"`
                echo "GW is transfered to K06CMA file."
        transfergsmacmadwa=`tx $i "echo CT_CMSLIST=$getGW  >> C:\PROGRA~1\IBM\ITM\TMAITM~1\k06cma.ini"`
                echo "GW is transfered to REGISTRY."
        transfergsmaregistrydwa=`tacmd executecommand -m $i -c "REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Candle\K06\Ver622\Primary\Environment /v CT_CMSLIST /d $getGW /f" -v -o -e`
                echo "RESTART GSMA AGENT."
        gsmastopdwa=`tx $i 'net stop k06cma'`
        gsmastartdwa=`tx $i 'net start k06cma'`
        svwithoutagent=`echo "$i" | cut -d":" -f1`
        checkifonline=`tacmd listsystems | grep -i $svwithoutagent`
        #echo "$checkifonline" | grep ' 06 ' | awk '{print$4}'
        if [[ `echo "$checkifonline" | grep ' 06 ' | awk '{print$4}' `  == "Y" ]];
        then
                echo "--SUCCESS !!--"
        echo "GSMA AGENT on server -- $svwithoutagent -- UP AND RUNNING"
        else
        echo "SOMETHING STILL IS BAD, NEED INVESTIGATION with server $svwithoutagent"
                echo "PROBLEM WITH GSMA AGENT $svwithoutagent" >> $PROBLEM
        #exit
        fi
fi
fi
done
}

generate_report
getsvrs
startagentsOS
startagentsGSMA
