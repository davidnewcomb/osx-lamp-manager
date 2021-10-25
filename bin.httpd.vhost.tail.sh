#!/usr/bin/env bash

. lang.sh
. fn.sh

question "Which vhost"
CFG=vhost.$ANSWER.cfg

if [ ! -f $CFG ]
then
	echo "Bad vhost number: $CFG does not exist"
	exit 1
fi

get_var_from $CFG OLM_CUSTOM_LOG

err_log=`get_var_from $CFG OLM_CUSTOM_LOG`
cus_log=`get_var_from $CFG OLM_ERROR_LOG`

echo "Tail error : $err_log"
echo "Tail custom: $cus_log"

tail -F $err_log $cus_log

