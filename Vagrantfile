# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "lb01" do |lb01|
    lb01.vm.box = "ubuntu/trusty64"
    lb01.vm.hostname = "lb01"
    lb01.vm.network :private_network, ip: "10.11.12.50"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
end
  config.vm.define "app01" do |app01|
    app01.vm.box = "puphpet/ubuntu1404-x64"
    app01.vm.hostname = "app01"
    app01.vm.network :private_network, ip: "10.11.12.51"
  config.vm.provision :puppet do |puppet|
    puppet.environment      = "development"
    puppet.environment_path = "environments"
end
end
  config.vm.define "app02" do |app02|
    app02.vm.box = "puphpet/ubuntu1404-x64"
    app02.vm.hostname = "app02"
    app02.vm.network :private_network, ip: "10.11.12.52"
  config.vm.provision :puppet do |puppet|
    puppet.environment      = "development"
    puppet.environment_path = "environments"
end
end
end
