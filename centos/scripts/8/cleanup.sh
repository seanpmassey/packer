#!/bin/bash
# Prepare Centos OS template for vSphere cloning
# @author Michael Poore
# @website https://blog.v12n.io

# Clean up kernels
# dnf remove --oldinstallonly --setopt installonly_limit=2

# Logs and cleanup
sudo cat /dev/null > /var/log/audit/audit.log
sudo cat /dev/null > /var/log/wtmp
sudo cat /dev/null > /var/log/lastlog
sudo cat /dev/null > /var/log/grubby

# Remove network interface config
sudo sed -i '/^(HWADDR|UUID)=/d' /etc/sysconfig/network-scripts/ifcfg-e*

# Tidy SSH keys
sudo rm -vf /etc/ssh/ssh_host_*

# Final cleanup
sudo systemctl stop systemd-journald.socket
sudo find /var/log -type f -exec rm {} \;
sudo mkdir -p /var/log/journal

echo "Cleanup done"