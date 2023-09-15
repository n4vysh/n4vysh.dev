#!/bin/bash

dir=$1
cd "$dir" || exit

rtx install -yj "$(nproc)"
