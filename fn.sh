#!/bin/bash

export HTTPDCONF="/usr/local/etc/httpd/extra/httpd-vhosts.conf"
export CELLAR=/usr/local/Cellar
export DN=/dev/null
export VHOST=/usr/local/var/vhost
export PYTHON=python
export ETCHOSTS="/private/etc/hosts"
export BACKUP="backup"
export DATE_STAMP=""
export MANAGED_APPS="httpd mysql mariadb mongodb/brew/mongodb-community"
export TD=tmp
export TEMPLATES=templates
export BIN=.

press_return() {
	local x=""

	echo ""
	echo -n "Press return..."
	read x
}

question() {
	local QUESTION="$1"
	local OPTS="$2"

	local q="$QUESTION"
	if [ "$OPTS" != "" ]
	then
		q="$q [$OPTS]: "
	else
		q="$q? "
	fi
	echo -n "$q"
	read ANSWER
	if [ "$ANSWER" = "q" ]
	then
		echo "Exiting..."
		exit 0
	fi
}

date_stamp() {
	DATE_STAMP=`date +%Y-%m-%d--%H-%M-%S`
}

backup_file() {
	date_stamp
	local FILE=$1

	mkdir -p $BACKUP
	if [ -f $FILE ]
	then
		file="$DATE_STAMP.`basename $FILE`"
		cp $FILE $BACKUP/$file
	fi
}

sub_menu_trailer() {
	echo ""
	echo "x. Back"
	echo ""
}

print_title() {
	local TITLE=$1
	local line=""

	for x in `seq 1 ${#TITLE}`
	do
		line="-$line"
	done

	echo "$TITLE"
	echo "$line"
	echo ""
}

printfn() {
	local format=$1
	format="$format\n"
	shift
	printf $format $*
}

get_next_vhost_num() {
	local idx=1
	while [ true ]
	do
		if [ ! -f ./vhost.$idx.cfg ]
		then
			break
		fi
		let idx=idx+1
	done
	echo $idx
}

get_var_from() {
	local file=$1
	local name=$2

	grep $name $file | sed "s/$name=//"
}

