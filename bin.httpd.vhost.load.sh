#!/usr/bin/env bash

. fn.sh

IN_FILE="y"
IDX=1

T_VFILE=""

echo "Loading $HTTPDCONF"
cat $HTTPDCONF | while read line
do
	if [ "`echo "$line" | grep '^<VirtualHost'`" != "" ]
	then
		IN_FILE="y"
		T_VFILE="vhost.$IDX"
		> $T_VFILE
		IDX=$((IDX + 1))
	fi

	if [ "$T_VFILE" != "" ]
	then
		echo $line >> $T_VFILE
	fi

	if [ "`echo $line | grep '^</VirtualHost'`" != "" ]
	then
		IN_FILE="n"
		T_VFILE=""
		echo -n "."
	fi
done
echo ""

