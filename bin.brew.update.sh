#!/usr/bin/env bash

. lang.sh
. fn.sh
date_stamp

UPDATE_OUT="$BACKUP/brew.update.$DATE_STAMP.out"
UPGRADE_OUT="$BACKUP/brew.upgrade.$DATE_STAMP.out"

brew update | tee $UPDATE_OUT
brew upgrade | tee $UPGRADE_OUT

echo ""
print_title "Brew update and upgrade completed"
echo ""
echo "See"
echo ""
echo "	$UPDATE_OUT"
echo "	$UPGRADE_OUT"
echo ""
echo "for copies of the output"
echo ""
echo ""
echo ""
