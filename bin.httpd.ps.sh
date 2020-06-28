#!/bin/bash

. fn.sh

T="$TD/httpd.ps"
ps -eaf | grep "bin/httpd" | grep -v "grep" | sort > $T
if [ -z $T ]
then
	echo "httpd is not running"
else
	grep " 1 " $T
	nline=`wc -l $T | awk '{ print $1-1 }'`
	echo "and $nline workers"
fi

rm $T
