smskey=`curl 'http://192.168.100.40:84/default/en_US/tools.html?type=sms' -H 'Authorization: Basic YWRtaW46YWRtaW4=' 2>/dev/null | grep smskey | sed -E 's/.*value="(.*)".*/\1/'`

curl 'http://192.168.100.40:84/default/en_US/sms_info.html?type=sms' -H 'Authorization: Basic YWRtaW46YWRtaW4='  --data "line7=1&smskey=$smskey&action=SMS&telnum=59151789&smscontent=ahan&send=Send" > /dev/null

curl 'http://192.168.100.40:84/default/en_US/send_sms_status.xml?line='  -H 'Authorization: Basic YWRtaW46YWRtaW4=' 
