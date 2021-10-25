#!/usr/bin/env bash

. fn.sh

HOST="$1"
IP="$2"

if [ "$IP" = "" ]
then
	IP="127.0.0.1"
fi

backup_file $ETCHOSTS

line="$IP $HOST"
if [ "`grep "^$line$" $ETCHOSTS > $DN 2> $DN`" = "" ]
then
	echo "$line" >> $ETCHOSTS
fi
