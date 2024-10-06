#!/bin/ksh

machine_agent()
{
chkmchnagnt=`ls -ltr /opt/ | grep adma`
if [[ -n "$chkmchnagnt"  ]]; then
        controller=`cat /opt/adma/conf/controller-info.xml | grep controller-host`
        account=`cat /opt/adma/conf/controller-info.xml | grep account-access-key`
        echo " "
        echo "MACHINE AGENT CONFIGURATION : "
        echo "$controller"
        echo "$account"
                info=`cat /opt/adma/conf/controller-info.xml |tail -4 | grep -v controller`
        echo " "
        echo "$info"
else
        echo "MACHINE AGENT IS NOT INSTALLED"
        exit
fi
}

java_agent()
{
chkjavaagnt=`ls -ltr /opt/ | grep adaajnat`
if [[ -n "$chkjavaagnt"  ]]; then
        controllerjava=`cat /opt/adaajnat/conf/controller-info.xml | grep controller-host | grep -v This`
        account=`cat /opt/adaajnat/conf/controller-info.xml | grep account-access-key | grep -v This`
        echo " "
        echo "APPLICATION AGENT CONFIGURATION : "
        echo " "
        echo "$controllerjava"
        echo "$account"
        echo " "
else
        echo "APPLICATION AGENT IS NOT INSTALLED"
        exit
fi
}

machine_agent
java_agent
