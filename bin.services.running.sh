#!/bin/bash

. lang.sh
. fn.sh

T="$TD/brew.services.list.txt"
brew services list > $T 2> $DN

echo "Services"

for prog in httpd mysql mariadb mongodb-community php
do
	grep $prog $T
done

rm $T

