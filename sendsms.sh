to='55555555'
content='last one'
credentials='admin:admin'

smskey=`curl -u $credentials 'http://192.168.100.40:84/default/en_US/tools.html?type=sms' 2>/dev/null | grep smskey | sed -E 's/.*value="(.*)".*/\1/'`

curl -u $credentials 'http://192.168.100.40:84/default/en_US/sms_info.html?type=sms' --data "line1=1&smskey=$smskey&action=SMS&telnum=$to&smscontent=$content&send=Send" > /dev/null

curl -u $credentials 'http://192.168.100.40:84/default/en_US/send_sms_status.xml?line='

echo $smskey
