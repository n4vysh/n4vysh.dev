#!/bin/bash

dir=$1
cd "$dir" || exit

mise install -yj "$(nproc)"
