#!/usr/bin/env bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e -u -x
sudo tee -a /etc/ssh/sshd_config <<EOF
UseDNS no
EOF
