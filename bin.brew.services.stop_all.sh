#!/usr/bin/env bash

. lang.sh
. fn.sh
. services.cfg

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

print_title "Stop all services"

for prog in ${SERVICES[*]}
do
	$BIN/bin.brew.services.stop.sh "$prog"
done

rm $T

