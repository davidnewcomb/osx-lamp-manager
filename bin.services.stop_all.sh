#!/bin/bash

. lang.sh
. fn.sh

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

print_title "Stop all services"

for prog in httpd mysql mariadb mongodb-community php
do
	brew services stop $prog > $BACKUP/$prog.stop.txt 2> $DN
	if [ $? -eq 0 ]
	then
		printfn "%-20sStopped" $prog
	else
		printfn "%-20sFailed" $prog
	fi
done

rm $T

