#!/bin/bash
yum install git -y

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

sudo /usr/bin/cp /vagrant/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

useradd ansible
echo -e "12345\n12345" | passwd ansible

echo ansible | sudo -S su - ansible -c "ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ''"

echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
