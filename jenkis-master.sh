#!/bin/bash
yum install git  wget -y

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

sudo /usr/bin/cp /vagrant/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

echo root | sudo -S su - root -c "ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ''"

yum install java-1.8.0-openjdk-devel -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins -y
systemctl start jenkins
systemctl status jenkins
systemctl enable jenkins
