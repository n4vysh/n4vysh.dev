#!/bin/bash

version=$(grep direnv .tool-versions | awk '{print $2}')
rtx plugin add direnv
rtx install "direnv@$version"

if ! [[ -e ~/.config/direnv/lib/use_rtx.sh ]]; then
	rtx direnv activate >~/.config/direnv/lib/use_rtx.sh
fi

eval "$(rtx exec direnv -- direnv hook bash)"
