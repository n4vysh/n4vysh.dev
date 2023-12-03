#!/bin/bash

dir=$1

cd "$dir" || exit
if type direnv >/dev/null 2>&1 &&
	direnv status |
	grep 'Found RC allowed false' >/dev/null; then
	direnv allow
fi
