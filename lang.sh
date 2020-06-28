#!/bin/bash

lang=`echo $LANG | sed 's/\..*//'`
lang_file="lang.$lang.sh"

if [ -f $lang_file ]
then
	. $lang_file
else
	lang=`echo $lang | sed 's/_.*//'`
	lang_file="lang.$lang.sh"

	if [ -f $lang_file ]
	then
		. $lang_file
	else
		lang_file="lang.en.sh"
		. $lang_file
	fi
fi

