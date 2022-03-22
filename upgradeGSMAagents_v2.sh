#!/bin/ksh
##UPDATE 06 AGENTS##
BASEALL="/users/wrobed/is4all"

generate_raport()
{
tacmd listsystems > $BASEALL
}

raport_update()
{
for i in $BASEALL
do
#grep ' 06 ' | grep -v 03.43 | grep -v 03.44
raport=`cat $i | grep ' Y ' | egrep ' 06 | 07 | 08 ' | grep -v 03.43 | grep -v 03.44 | grep -v 03.40 | grep -v 03.31 | grep -v pa01lsrv0253`
#agent=`echo $raport | awk '{print$2}'`
#echo "$raport"
done
}

update06()
{
#serversux=`echo "$raport" | grep ' 07 '`
basicserverswin=`echo "$raport" | grep ' 06 ' | cut -d":" -f1 | sort -n`
#echo "$basicserversux"
for c in $basicserverswin
do
tacmd updateagent -n ${c}:NT -f -t 06
done
}

update07()
{
#serversux=`echo "$raport" | grep ' 07 '`
basicserversux=`echo "$raport" | grep ' 07 ' | cut -d":" -f1 | sort -n`
#echo "$basicserversux"
for a in $basicserversux
do
tacmd updateagent -n ${a}:KUX -f -t 07
done
}

update08()
{
#serverslz=`echo "$raport" | grep ' 08 '`
basicserverslz=`echo "$raport" | grep ' 08 ' | cut -d":" -f1`
#echo "$basicserversux"
for b in $basicserverslz
do
tacmd updateagent -n ${b}:LZ -f -t 08
done
}

generate_raport
raport_update
#update07
update06
update08
