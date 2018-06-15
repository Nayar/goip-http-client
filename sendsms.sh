#!/bin/bash
function usage {
    echo "Usage: sendsms.sh tonum content"
}

credentials='admin:admin'
to=$1
content=$2
goip_address='192.168.100.40:84'

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

smskey=`curl -u $credentials 'http:///default/en_US/tools.html?type=sms' 2>/dev/null | grep smskey | sed -E 's/.*value="(.*)".*/\1/'`

curl -u $credentials "http://$goip_address/default/en_US/sms_info.html?type=sms" --data "line1=1&smskey=$smskey&action=SMS&telnum=$to&smscontent=$content&send=Send" > /dev/null

#curl -u $credentials "http://$goip_address/default/en_US/send_sms_status.xml?line="

echo $smskey
