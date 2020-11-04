#!/bin/bash

# This script is intended to create test containers in LXD

# You will need a working LXD setup before running

# This script does *NOT* check for existing containers of the same name!

# These are the credentials for the containers
username=zbx_builder
pass=Supersecret123454321

if [[ "$1" == "-h" ]]; then
	# Help, I'm lost!
	echo -e "Basic Usage:\n\n"
	echo -e "\t$0 -h\t\tThis help!"
	echo -e "\t$0 -c\t\tCreate containers."
	echo -e "\t$0 -d\t\tDestroy containers."

elif [[ "$1" == "-c" ]]; then
	# Create containers
	#lxc launch ubuntu:18.04/armhf zbx-armhf-18
	#lxc launch ubuntu:20.04/armhf zbx-armhf-20
	#lxc launch ubuntu:18.04/arm64 zbx-arm64-18
	lxc launch ubuntu:20.04/arm64 zbx-arm64-20

	# Configure ubuntu 18.04 container
	#lxc exec zbx-armhf-18 -- bash -c "sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config"
	#lxc exec zbx-armhf-18 -- bash -c "systemctl restart sshd"
	#lxc exec zbx-armhf-18 -- bash -c "useradd -G sudo,adm -m $username"
	#lxc exec zbx-armhf-18 -- bash -c "echo $username:$pass | chpasswd"
	#lxc exec zbx-armhf-18 -- bash -c "usermod -s /bin/bash $username"
	#lxc exec zbx-armhf-18 -- bash -c "echo -e \"APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";\" > /etc/apt/apt.conf.d/20auto-upgrades"
	#lxc exec zbx-armhf-18 -- bash -c "echo -e \"APT::Periodic::Enable \"0\";\" > /etc/apt/apt.conf.d/02periodic"

	# Configure ubuntu 20.04 container
	#lxc exec zbx-armhf-20 -- bash -c "sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config"
	#lxc exec zbx-armhf-20 -- bash -c "systemctl restart sshd"
	#lxc exec zbx-armhf-20 -- bash -c "useradd -G sudo,adm -m $username"
	#lxc exec zbx-armhf-20 -- bash -c "echo $username:$pass | chpasswd"
	#lxc exec zbx-armhf-20 -- bash -c "usermod -s /bin/bash $username"
	#lxc exec zbx-armhf-20 -- bash -c "echo -e \"APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";\" > /etc/apt/apt.conf.d/20auto-upgrades"
	#lxc exec zbx-armhf-20 -- bash -c "echo -e \"APT::Periodic::Enable \"0\";\" > /etc/apt/apt.conf.d/02periodic"

	# Configure ubuntu 18.04 container
	#lxc exec zbx-arm64-18 -- bash -c "sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config"
	#lxc exec zbx-arm64-18 -- bash -c "systemctl restart sshd"
	#lxc exec zbx-arm64-18 -- bash -c "useradd -G sudo,adm -m $username"
	#lxc exec zbx-arm64-18 -- bash -c "echo $username:$pass | chpasswd"
	#lxc exec zbx-arm64-18 -- bash -c "usermod -s /bin/bash $username"
	#lxc exec zbx-arm64-18 -- bash -c "echo -e \"APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";\" > /etc/apt/apt.conf.d/20auto-upgrades"
	#lxc exec zbx-arm64-18 -- bash -c "echo -e \"APT::Periodic::Enable \"0\";\" > /etc/apt/apt.conf.d/02periodic"

	# Configure ubuntu 20.04 container
	lxc exec zbx-arm64-20 -- bash -c "sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config"
	lxc exec zbx-arm64-20 -- bash -c "systemctl restart sshd"
	lxc exec zbx-arm64-20 -- bash -c "useradd -G sudo,adm -m $username"
	lxc exec zbx-arm64-20 -- bash -c "echo $username:$pass | chpasswd"
	lxc exec zbx-arm64-20 -- bash -c "usermod -s /bin/bash $username"
	lxc exec zbx-arm64-20 -- bash -c "echo -e \"APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";\" > /etc/apt/apt.conf.d/20auto-upgrades"
	lxc exec zbx-arm64-20 -- bash -c "echo -e \"APT::Periodic::Enable \"0\";\" > /etc/apt/apt.conf.d/02periodic"

	# Get the IP address for each of the running containers
	#zbx_armhf_18_ip=`lxc list|grep zbx-armhf-18 | awk '{print $6}'`
	#zbx_armhf_20_ip=`lxc list|grep zbx-armhf-20 | awk '{print $6}'`
	#zbx_arm64_18_ip=`lxc list|grep zbx-arm64-18 | awk '{print $6}'`
	#zbx_arm64_20_ip=`lxc list|grep zbx-arm64-20 | awk '{print $6}'`

	# Pause for user input before ssh so ssh does not timeout if I go for coffee
	#read -p "Please press a key to continue with ssh access testing: "

	# ssh into each container and sudo to root to take care of fingerprints 
	# and sudo warnings that can interfear with ansible
	#ssh -t $username@$zbx_armhf_18_ip sudo -i
	#ssh -t $username@$zbx_armhf_20_ip sudo -i
	#ssh -t $username@$zbx_arm64_18_ip sudo -i
	#ssh -t $username@$zbx_arm64_20_ip sudo -i

	# Install official repo
	#lxc exec zbx-armhf-18 -- bash -c "echo \"deb-src https://repo.zabbix.com/zabbix/5.0/ubuntu bionic main\" >> /etc/apt/sources.list.d/zabbix.list"
	#lxc exec zbx-armhf-20 -- bash -c "echo \"deb-src https://repo.zabbix.com/zabbix/5.0/ubuntu focal main\" >> /etc/apt/sources.list.d/zabbix.list"
	#lxc exec zbx-arm64-18 -- bash -c "echo \"deb-src https://repo.zabbix.com/zabbix/5.0/ubuntu bionic main\" >> /etc/apt/sources.list.d/zabbix.list"
	lxc exec zbx-arm64-20 -- bash -c "echo \"deb-src https://repo.zabbix.com/zabbix/5.0/ubuntu focal main\" >> /etc/apt/sources.list.d/zabbix.list"

	# Add Zabbix repo key
	#lxc exec zbx-armhf-18 -- bash -c "curl -s https://repo.zabbix.com/zabbix-official-repo.key | apt-key add -"
	#lxc exec zbx-armhf-20 -- bash -c "curl -s https://repo.zabbix.com/zabbix-official-repo.key | apt-key add -"
	#lxc exec zbx-arm64-18 -- bash -c "curl -s https://repo.zabbix.com/zabbix-official-repo.key | apt-key add -"
	lxc exec zbx-arm64-20 -- bash -c "curl -s https://repo.zabbix.com/zabbix-official-repo.key | apt-key add -"

	# Update sources
	#lxc exec zbx-armhf-18 -- bash -c "apt update"
	#lxc exec zbx-armhf-20 -- bash -c "apt update"
	#lxc exec zbx-arm64-18 -- bash -c "apt update"
	lxc exec zbx-arm64-20 -- bash -c "apt update"

	# Install build deps
	#lxc exec zbx-armhf-18 -- bash -c "apt build-dep zabbix -y"
	#lxc exec zbx-armhf-20 -- bash -c "apt build-dep zabbix -y"
	#lxc exec zbx-arm64-18 -- bash -c "apt build-dep zabbix -y"
	lxc exec zbx-arm64-20 -- bash -c "apt build-dep zabbix -y"

	# Install build essential
	#lxc exec zbx-armhf-18 -- bash -c "apt install build-essential -y"
	#lxc exec zbx-armhf-20 -- bash -c "apt install build-essential -y"
	#lxc exec zbx-arm64-18 -- bash -c "apt install build-essential -y"
	lxc exec zbx-arm64-20 -- bash -c "apt install build-essential -y"

	# Install dev scripts
	#lxc exec zbx-armhf-18 -- bash -c "apt install devscripts -y"
	#lxc exec zbx-armhf-20 -- bash -c "apt install devscripts -y"
	#lxc exec zbx-arm64-18 -- bash -c "apt install devscripts -y"
	lxc exec zbx-arm64-20 -- bash -c "apt install devscripts -y"

	# Get zabbix source
	#lxc exec zbx-armhf-18 -- bash -c "apt source zabbix"
	#lxc exec zbx-armhf-20 -- bash -c "apt source zabbix"
	#lxc exec zbx-arm64-18 -- bash -c "apt source zabbix"
	lxc exec zbx-arm64-20 -- bash -c "apt source zabbix"

	# Install golang - see bug # ZBX-18459
	#lxc exec zbx-armhf-18 -- bash -c "apt install golang -y"
	#lxc exec zbx-armhf-20 -- bash -c "apt install golang -y"
	#lxc exec zbx-arm64-18 -- bash -c "apt install golang -y"
	lxc exec zbx-arm64-20 -- bash -c "apt install golang -y"

	# build
	#lxc exec zbx-armhf-18 -- bash -c "cd zabbix-5.* && debuild -us -uc"
	#lxc exec zbx-armhf-20 -- bash -c "cd zabbix-5.* && debuild -us -uc"
	#lxc exec zbx-arm64-18 -- bash -c "cd zabbix-5.* && debuild -us -uc"
	lxc exec zbx-arm64-20 -- bash -c "cd zabbix-5.* && debuild -us -uc"

	# FIXME: copy built .deb's and .ddeb's


elif [[ "$1" == "-d" ]]; then
	# Stop and delete the containers
	#lxc stop zbx-armhf-18 --force
	#lxc stop zbx-armhf-20 --force
	#lxc stop zbx-arm64-18 --force
	lxc stop zbx-arm64-20 --force
	#lxc delete zbx-armhf-18
	#lxc delete zbx-armhf-20
	#lxc delete zbx-arm64-18
	lxc delete zbx-arm64-20

else
	# Try typing better!
	echo "Sorry, unknown command: $1"
fi

