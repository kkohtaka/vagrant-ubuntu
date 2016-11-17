# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

BOX_NAME=ubuntu-xenial
BOX_FILE=$(BOX_NAME)_virtualbox.box

default: build
all: clean build install

.PHONY: clean

$(BOX_FILE): packer.json
	packer build $<

clean:
	rm $(BOX_FILE)

build: $(BOX_FILE)

install: $(BOX_FILE)
	vagrant box add --force $(BOX_NAME) $<
