#!/usr/bin/env bash

. lang.sh
. fn.sh

if [ $# -ne 1 ]
then	
	echo "Error: $0 missing param"
	exit 1
fi

service="$1"

cmd="brew services start $service"
echo "Command: $cmd"
#brew services start "$service" > "$BACKUP/$service.start.o.txt" 2> "$BACKUP/$service.start.e.txt"
$cmd > "$BACKUP/$service.start.o.txt" 2> "$BACKUP/$service.start.e.txt"
RC=$?
if [ $RC -eq 0 ]
then
	printfn "%-20sStarted" $service
else
	printfn "%-20sFailed" $service
	x=$(make_one_line "$BACKUP/$service.start.o.txt")
	if [ "$x" != "" ]
	then
		echo "Out  : $x"
	fi
	x=$(make_one_line "$BACKUP/$service.start.e.txt")
	if [ "$x" != "" ]
	then
		echo "Error ($RC)  : $x"
	fi
fi


