#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)
cd "$dir" || exit

"$dir/scripts/install/rtx-packages.bash" "$dir/infra"
"$dir/scripts/install/direnv-allow.bash" "$dir/infra"
