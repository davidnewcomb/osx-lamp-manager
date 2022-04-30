#!/usr/bin/env bash

. lang.sh
. fn.sh

if [ $# -ne 1 ]
then	
	echo "Error: $0 missing param"
	exit 1
fi

service="$1"

cmd="brew services restart $service"
echo "Command: $cmd"
#brew services restart "$service" > "$BACKUP/$service.restart.o.txt" 2> "$BACKUP/$service.restart.e.txt"
$cmd > "$BACKUP/$service.restart.o.txt" 2> "$BACKUP/$service.restart.e.txt"
RC=$?
if [ $RC -eq 0 ]
then
	printfn "%-20sRestarted" $service
else
	printfn "%-20sFailed" $service
	x=$(make_one_line "$BACKUP/$service.restart.o.txt")
	if [ "$x" != "" ]
	then
		echo "Out  : $x"
	fi
	x=$(make_one_line "$BACKUP/$service.restart.e.txt")
	if [ "$x" != "" ]
	then
		echo "Error ($RC)  : $x"
	fi
fi


