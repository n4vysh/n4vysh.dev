#!/bin/bash

declare -A flag
while getopts ie opt; do
	case "$opt" in
	i)
		flag[i]=1
		;;
	e)
		flag[e]=1
		;;
	*) ;;
	esac
done
shift $((OPTIND - 1))

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)

"$dir/scripts/install/devbox.bash"

if [[ ${flag[i]} == 1 ]]; then
	"$dir/scripts/install/rtx-direnv-integration.bash"
fi

"$dir/scripts/install/rtx-packages.bash" "$dir"
"$dir/scripts/install/rtx-direnv.bash" "$dir"

if [[ ${flag[e]} == 1 ]]; then
	eval "$(direnv export bash)"
fi

"$dir/scripts/execute-parallel.bash" direnv exec "$dir" <<-EOF
	$dir/scripts/install/node-packages.bash $dir/misc/
	$dir/scripts/install/lefthook.bash
	$dir/frontend/scripts/install-packages.bash
	$dir/infra/scripts/install-packages.bash
	$dir/misc/scripts/download-vale-styles.bash
EOF
