#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)

_update() {
	dir="$1"
	cd "$dir" || exit
	awk '{print $1}' .tool-versions |
		xargs -t -I {} sh -c 'asdf install {} latest && asdf local {} latest'
}
export -f _update

find "$dir" -name .tool-versions -printf '%h\n' |
	sort |
	xargs -I {} sh -c '_update {}'
