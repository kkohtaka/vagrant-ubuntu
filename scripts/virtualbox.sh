#!/usr/bin/env bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e -u -x

if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

sudo apt-get install -y \
  dkms \
  make

sudo mount -o loop $HOME/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f $HOME/VBoxGuestAdditions.iso

VBOX_VERSION=$(cat $HOME/.vbox_version)
if [[ $VBOX_VERSION = "4.3.10" ]]; then
    ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
fi
rm $HOME/.vbox_version
