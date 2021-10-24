#!/bin/bash

. lang.sh
. fn.sh

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

print_title "Start all services"

for prog in httpd mysql@5.7 mariadb mongodb-community php@5.6
do
	brew services start "$prog" > "$BACKUP/$prog.start.o.txt" 2> "$BACKUP/$prog.start.e.txt"
	if [ $? -eq 0 ]
	then
		printfn "%-20sStarted" $prog
	else
		printfn "%-20sFailed" $prog
		e=$(make_one_line "$BACKUP/$prog.start.e.txt")
		if [ -s "$BACKUP/$prog.start.o.txt" ]
		then
			x=$(make_one_line "$BACKUP/$prog.start.o.txt")
			echo "Out  : $o"
		fi
		if [ -s "$BACKUP/$prog.start.e.txt" ]
		then
			x=$(make_one_line "$BACKUP/$prog.start.e.txt")
			echo "Error: $e"
		fi
	fi
done

rm $T

