#!/usr/bin/env bash

. lang.sh
. fn.sh

if [ $# -ne 1 ]
then	
	echo "Error: $0 missing param"
	exit 1
fi

service="$1"

brew services start "$service" > "$BACKUP/$service.start.o.txt" 2> "$BACKUP/$service.start.e.txt"
if [ $? -eq 0 ]
then
	printfn "%-20sStarted" $service
else
	printfn "%-20sFailed" $service
	e=$(make_one_line "$BACKUP/$service.start.e.txt")
	if [ -s "$BACKUP/$service.start.o.txt" ]
	then
		x=$(make_one_line "$BACKUP/$service.start.o.txt")
		echo "Out  : $o"
	fi
	if [ -s "$BACKUP/$service.start.e.txt" ]
	then
		x=$(make_one_line "$BACKUP/$service.start.e.txt")
		echo "Error: $e"
	fi
fi


