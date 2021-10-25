#!/usr/bin/env bash

. fn.sh

print_title "HTTPD Virtual Hosts"

some="-none-"

for num in `ls vhost.*.cfg 2> $DN | sed 's/vhost.\(.*\).cfg/\1/' | sort -n`
do
	some=""
	server=`grep OLM_SERVER_NAME vhost.$num.cfg | sed 's/OLM_SERVER_NAME=//'`
	echo "$num. $server"
done

if [ "$some" != "" ]
then
	echo $some
fi

echo ""
echo "-------------------"

