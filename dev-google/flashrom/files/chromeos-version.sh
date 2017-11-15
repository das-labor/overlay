#!/bin/bash
# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This script is given one argument: the base of the source directory of
# the package, and it prints a string on stdout with the numerical version
# number for said repo.

exec awk '$1 == "RELEASE" { print $NF }' "$1/Makefile"
