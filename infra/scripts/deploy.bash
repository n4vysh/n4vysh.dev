#!/bin/bash

dir=$(
	cd "$(dirname "$0")" || exit
	git rev-parse --show-toplevel
)
ENV=$("$dir"/scripts/get-env.bash)

if [[ $ENV =~ ^(staging|production)$ ]]; then
	just terragrunt/apply
	"$dir"/infra/scripts/get-creds.bash
else
	echo 'No support this environment' 1>&2
	exit 1
fi
