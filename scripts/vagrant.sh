#!/usr/bin/env bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e -u -x

date | sudo tee /etc/vagrant_box_build_time

mkdir -p $HOME/.ssh
curl -fsSLo $HOME/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys
