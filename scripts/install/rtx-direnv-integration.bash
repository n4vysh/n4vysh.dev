#!/bin/bash

mkdir -p ~/.config/direnv/lib/
if ! [[ -e ~/.config/direnv/lib/use_rtx.sh ]]; then
	rtx direnv activate >~/.config/direnv/lib/use_rtx.sh
fi
