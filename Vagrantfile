# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.vm.define "hadoop" do |hadoop|
        hadoop.vm.box = "ubuntu/trusty64"
	hadoop.vm.hostname = "hadoop"
        hadoop.vm.network "private_network", ip: "192.168.33.10"
        hadoop.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 2
            vb.memory = "4096"
        end

        # copy the /etc/hadoop config directory
        hadoop.vm.provision "file", source: "./hadoop-config.tar.gz", destination: "/home/vagrant/hadoop-config.tar.gz"
        hadoop.vm.provision "shell", path: "provision_all_first.sh", privileged: false
        hadoop.vm.provision "shell", path: "provision_hadoop.sh", privileged: false
    end

    config.vm.define "spark" do |spark|
        spark.vm.box = "ubuntu/trusty64"
	spark.vm.hostname = "spark"
        spark.vm.network "private_network", ip: "192.168.33.11"
        spark.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.cpus = 1
            vb.memory = "1024"
        end
        spark.vm.provision "file", source: "./hadoop-config.tar.gz", destination: "/home/vagrant/hadoop-config.tar.gz"
        spark.vm.provision "shell", path: "provision_all_first.sh", privileged: false
        spark.vm.provision "shell", path: "provision_spark.sh", privileged: false
    end

    ## N.B. TODO - ssh keys between machines
end
