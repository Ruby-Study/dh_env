# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos"
  config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

  # 1024 < port <
  #shipyard
  config.vm.network :forwarded_port, guest: 8005, host: 8005

  #elasticsearch
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  config.vm.network :forwarded_port, guest: 9300, host: 9300

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    #memory
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provision "docker" do |d|
    #TODO
  end
end
