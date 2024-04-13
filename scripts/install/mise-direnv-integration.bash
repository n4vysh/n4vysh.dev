#!/bin/bash

mkdir -p ~/.config/direnv/lib/
if ! [[ -e ~/.config/direnv/lib/use_mise.sh ]]; then
	mise direnv activate >~/.config/direnv/lib/use_mise.sh
fi
