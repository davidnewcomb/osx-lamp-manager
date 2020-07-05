#!/bin/bash

. lang.sh
. fn.sh

if [ $# -ne 2 ]
then
	echo "usage: `basename $0` template_name vhost_number"
	exit 1
fi

TEMPLATE_BASE=$1
TEMPLATE_QUESTIONS=templates/$TEMPLATE_BASE.questions
TEMPLATE_TXT=templates/$TEMPLATE_BASE.template
VHOST=$2

if [ -f ./vhost.$VHOST.cfg ]
then
	echo "Loading vhost.$VHOST.cfg"
	. ./vhost.$VHOST.cfg
fi

IFS=$'\n' read -d '' -r -a LINES < $TEMPLATE_QUESTIONS

let last=${#LINES[*]}-1
for i in `seq 0 $last`
do
	line=${LINES[$i]}

	e=`echo $line | sed 's/\(.*\) "\(.*\)" "\(.*\)"/name="\1"; quest="\2"; def="\3";/'`
	eval $e

	if [ "${!name}" != "" ]
	then
		def=${!name}
	fi
	
	question "$quest [$def]"
	if [ "$ANSWER" = "" ]
	then
		eval $name="$def"
	else
		eval $name="$ANSWER"
	fi
done

T=$TD/vh.t

set | grep "^OLM_" > ./vhost.$VHOST.cfg

cat $TEMPLATE_TXT > $T
set | grep "^OLM_" | sed 's/OLM_\(.*\)=\(.*\)/\1 \2/' | while read tag val
do
	sed "s>%$tag%>$val>g" $T > ${T}_
	mv ${T}_ ${T}
done


cat $T > ./vhost.$VHOST
echo $OLM_SERVER_NAME > $TD/$TEMPLATE.answer
rm $T

exit 0
