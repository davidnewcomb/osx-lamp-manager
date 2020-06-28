#!/bin/bash

. lang.sh
. fn.sh

question "Which vhost"
f="vhost.$ANSWER"

if [ ! -f $f ]
then
	echo "Bad vhost number: $f does not exist"
	exit 1
fi
err_log=`grep "^ErrorLog" $f | sed 's/ErrorLog "\(.*\)"/\1/'`
cus_log=`grep "^CustomLog" $f | sed 's/CustomLog "\(.*\)".*/\1/'`
echo "Tail error: $err_log"
echo "Tail error: $cus_log"
tail -F $err_log $cus_log

