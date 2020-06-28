#!/bin/bash

. fn.sh

print_title "HTTPD Virtual Hosts"

some="-none-"

for num in `ls vhost.[0-9]* 2> $DN | sed 's/vhost.//' | sort -n`
do
	some=""
	#num=`echo $file | sed 's/vhost.//'`
	server=`grep ServerName "vhost.$num" | sed 's/ServerName //'`
	echo "$num. $server"
done

if [ "$some" != "" ]
then
	echo $some
fi

echo ""
echo "-------------------"

