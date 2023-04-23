#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)

if [[ -e "$dir/.git/COMMIT_EDITMSG" ]]; then
	commitlint --edit --verbose
elif [[ $(git rev-list --count HEAD) == 1 ]]; then
	commitlint --to HEAD --verbose
else
	commitlint --from=HEAD^1 --verbose
fi
