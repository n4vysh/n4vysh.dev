#!/bin/bash

dir=$1

cd "$dir" || exit
if type rtx >/dev/null 2>&1 &&
	rtx which direnv >/dev/null 2>&1 &&
	rtx exec direnv -- direnv status |
	grep 'Found RC allowed 2' >/dev/null; then
	rtx exec direnv -- direnv allow
fi
