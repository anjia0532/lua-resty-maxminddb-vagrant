# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    config.vm.box_check_update = false
    config.vm.box = "ubuntu/xenial64"
    config.vm.hostname = "openresty"
    # config.vm.network "private_network", ip: "172.17.8.102"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
      vb.name = "openresty"
    end
    config.vm.network "forwarded_port", guest: 80, host: 8080
  
    config.vm.synced_folder ".", "/vagrant", type: "rsync",
      rsync__verbose: true,
      rsync__exclude: ['.git*', 'node_modules*','*.log','*.box','Vagrantfile']
  
    config.vm.provision "shell", path: "init.sh"
  end
  
  