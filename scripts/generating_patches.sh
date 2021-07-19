#!/bin/bash

set -e
set -x

echo "This is part of script which will generate the release patches or source code tarball"
echo "Usage $0 <git-format-patch-args>"
git format-patch $*
