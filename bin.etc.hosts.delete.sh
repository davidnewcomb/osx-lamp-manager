#!/bin/bash

. fn.sh

HOST="$1"
IP="$2"

if [ "$IP" = "" ]
then
	IP="127.0.0.1"
fi

backup_file $ETCHOSTS

T="$TD/new_hosts"
line="$IP $HOST"
grep -v "^$line$" $ETCHOSTS > $T
echo $line >> $T
cp $T $ETCHOSTS
rm $T

