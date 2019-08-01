# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'
HOST_IP = '192.168.33.30'
HOST2_IP = '192.168.33.31'
HOST3_IP = '192.168.33.32'
HOST4_IP = '192.168.33.33'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
config.vm.define "jenkis-master" do |ansible1|
ansible1.vm.hostname = "jenkins-master"
ansible1.vm.box = "centos/7"
ansible1.vm.box_url = "centos/7"
ansible1.vm.network :private_network,
      ip: HOST_IP,
      netmask: '255.255.255.0'
ansible1.vm.network :forwarded_port, guest: 8800, host: 8080
#ansible1.vm.synced_folder 'html', '/var/www/html'
ansible1.vm.provision 'shell', path: 'jenkis-master.sh'	
end

config.vm.define "jenkins-slave" do |ansible2|
ansible2.vm.hostname = "jenkins-slave"
ansible2.vm.box = "centos/7"
ansible2.vm.box_url = "centos/7"
ansible2.vm.network :private_network,
      ip: HOST2_IP,
      netmask: '255.255.255.0'
#ansible1.vm.network :forwarded_port, guest: 8800, host: 8080
#ansible1.vm.synced_folder 'html', '/var/www/html'
ansible2.vm.provision 'shell', path: 'jenkins-slave.sh'
end

config.vm.define "ansible-cont" do |ansible3|
ansible3.vm.hostname = "ansible-cont"
ansible3.vm.box = "centos/7"
ansible3.vm.box_url = "centos/7"
ansible3.vm.network :private_network,
      ip: HOST3_IP,
      netmask: '255.255.255.0'
#ansible1.vm.network :forwarded_port, guest: 8800, host: 8080
#ansible1.vm.synced_folder 'html', '/var/www/html'
ansible3.vm.provision 'shell', path: 'ansible-controller.sh'
end

config.vm.define "ansible-agent" do |ansible4|
ansible4.vm.hostname = "ansible-agent"
ansible4.vm.box = "centos/7"
ansible4.vm.box_url = "centos/7"
ansible4.vm.network :private_network,
      ip: HOST4_IP,
      netmask: '255.255.255.0'
#ansible1.vm.network :forwarded_port, guest: 8800, host: 8080
#ansible1.vm.synced_folder 'html', '/var/www/html'
ansible4.vm.provision 'shell', path: 'ansible-agent.sh'
end
end