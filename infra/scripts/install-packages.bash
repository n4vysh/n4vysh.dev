#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)
cd "$dir" || exit

"$dir/scripts/init/asdf-direnv.bash" "$dir/infra"
"$dir/scripts/install/asdf-packages.bash" "$dir/infra"
