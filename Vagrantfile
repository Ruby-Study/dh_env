# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # 1024 < port < 49151
  #shipyard
  config.vm.network :forwarded_port, guest: 8005, host: 8005

  #elasticsearch
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  config.vm.network :forwarded_port, guest: 9300, host: 9300

  #memcached


  #mysql
  config.vm.network :forwarded_port, guest: 3306, host: 3306


  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    #memory
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "docker" do |d|
    d.pull_images "blackanger/my-mysql-server"
    d.pull_images "dockerfile/elasticsearch"
    d.pull_images "tutum/centos"
  end

  config.vm.provision :shell, path: "bootstrap.sh"
end
