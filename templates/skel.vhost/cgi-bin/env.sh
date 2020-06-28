#!/bin/bash
SORT=/usr/bin/sort
ENV=/usr/bin/env

echo Content-type: text/plain
echo ""

echo "** Environment **"
echo ""
$ENV | $SORT

echo ""
echo ""
echo ""

echo "** set **"
echo ""
set
