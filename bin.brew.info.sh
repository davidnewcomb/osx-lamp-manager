#!/bin/bash

. lang.sh
. fn.sh

cd $CELLAR
ls -d httpd*/* *mysql*/* mariadb*/* mongodb*/* php*/* node*/* \
	| sort \
	| sed "s>/> >" \
	| while read package version
do
	printfn "%20s%20s" $package $version
done

