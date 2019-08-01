#!/bin/bash
yum install git -y

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

sudo /usr/bin/cp /vagrant/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

echo root | sudo -S su - root -c "ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ''"

yum install java-1.8.0-openjdk-devel -y