#!/bin/bash
function usage {
    echo "Usage: sendsms.sh tonum content [line]"
}

credentials='admin:admin'
to=$1
content=$2
goip_address='192.168.100.40:84'
line=$3

if [ -z "$to" ]
then 
    usage 
    exit 1
fi

if [ -z "$content" ]
then 
    usage 
    exit 1
fi

if [ -z "$line" ]
then 
    line=7
else
    
    line=$3
fi

smskey=`curl -u $credentials "http://$goip_address/default/en_US/tools.html?type=sms" 2>/dev/null | grep smskey | sed -E 's/.*value="(.*)".*/\1/'`

if [ -z "$smskey" ]
then 
    echo 'Unable to get SMS key'
    exit 1
fi

curl -u $credentials "http://$goip_address/default/en_US/sms_info.html?type=sms" --data "line$line=1&smskey=$smskey&action=SMS&telnum=$to&smscontent=$content&send=Send" > /dev/null 2>&1

echo $smskey
exit 0
