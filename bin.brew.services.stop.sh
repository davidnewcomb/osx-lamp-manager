#!/usr/bin/env bash

. lang.sh
. fn.sh

if [ $# -ne 1 ]
then	
	echo "Error: $0 missing param"
	exit 1
fi

service="$1"

brew services stop "$service" > "$BACKUP/$service.stop.o.txt" 2> "$BACKUP/$service.stop.e.txt"
if [ $? -eq 0 ]
then
	printfn "%-20sStopped" $service
else
	printfn "%-20sFailed" $service
	e=$(make_one_line "$BACKUP/$service.stop.e.txt")
	if [ -s "$BACKUP/$service.stop.o.txt" ]
	then
		x=$(make_one_line "$BACKUP/$service.stop.o.txt")
		echo "Out  : $o"
	fi
	if [ -s "$BACKUP/$service.stop.e.txt" ]
	then
		x=$(make_one_line "$BACKUP/$service.stop.e.txt")
		echo "Error: $e"
	fi
fi

