#!/bin/bash

. lang.sh
. fn.sh


echo "$L_SAVING_TO $HTTPDCONF"
backup_file $HTTPDCONF
cat $TEMPLATES/block.httpd-vhosts.conf.header.txt > $HTTPDCONF

for vhost in `ls vhost.[0-9]*`
do
	cat $vhost >> $HTTPDCONF

	doc_root=`grep DocumentRoot $vhost | awk '{ print $2 }'`
	if [ ! -d $doc_root ]
	then
		question "Copy skeleton for $doc_root"
		if [ "$ANSWER" = "y" ]
		then
			cp -rvp $TEMPLATES/vhost.skel $doc_root
		fi
	fi
done

