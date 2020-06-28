#!/bin/bash

. lang.sh
. fn.sh

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

print_title "Start all services"

for prog in httpd mysql mariadb mongodb-community php
do
	brew services start $prog > $BACKUP/$prog.start.txt 2> $DN
	if [ $? -eq 0 ]
	then
		printfn "%-20sStarted" $prog
	else
		printfn "%-20sFailed" $prog
	fi
done

rm $T

