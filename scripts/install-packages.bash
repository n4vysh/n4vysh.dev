#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)

"$dir/scripts/install/devbox.bash"
eval "$(devbox shellenv)"

"$dir/scripts/install/mise-direnv-integration.bash"
"$dir/scripts/install/mise-packages.bash" "$dir"
"$dir/scripts/install/direnv-allow.bash" "$dir"

"$dir/scripts/execute-parallel.bash" direnv exec "$dir" <<-EOF
	$dir/scripts/install/node-packages.bash $dir/misc/
	$dir/scripts/install/lefthook.bash
	$dir/frontend/scripts/install-packages.bash
	$dir/infra/scripts/install-packages.bash
	$dir/misc/scripts/download-vale-styles.bash
EOF
