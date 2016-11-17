# -*- mode: ruby -*-
# vi: set ft=ruby :
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

Vagrant.configure("2") do |config|
    config.vm.define "ubuntu-xenial"
    config.vm.box = "ubuntu-xenial"

    config.vm.provider :virtualbox do |v, override|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 1]
    end

    ["vmware_fusion", "vmware_workstation"].each do |provider|
      config.vm.provider provider do |v, override|
        v.gui = false
        v.vmx["memsize"] = "1024"
        v.vmx["numvcpus"] = "1"
      end
    end
end
