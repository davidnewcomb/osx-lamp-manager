#!/usr/bin/env bash

. lang.sh
. fn.sh
. services.cfg

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

i=1
for prog in ${SERVICES[*]}
do
	status=$(grep $prog $T)
	echo "$i. $status"
	let "i += 1"
done

rm $T

