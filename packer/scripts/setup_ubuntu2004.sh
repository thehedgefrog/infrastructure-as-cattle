#!/bin/bash

echo '> Cleaning all audit logs ...'
if [ -f /var/log/audit/audit.log ]; then
cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
cat /dev/null > /var/log/lastlog
fi

# Cleans SSH keys.
echo '> Cleaning SSH keys ...'
rm -f /etc/ssh/ssh_host_*

## Sets hostname to ubuntu-template.
echo '> Setting hostname to ubuntu-template ...'
cat /dev/null > /etc/hostname
hostnamectl set-hostname ubuntu-template

# Cleans apt-get.
echo '> Cleaning apt-get ...'
apt-get clean

# Cleans cloud-init
echo '> Cleaning cloud-init ...'
rm -rf /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
rm -rf /etc/cloud/cloud.cfg.d/99-installer.cfg
# rm -rf /var/lib/cloud/
cloud-init clean

# Cleans the machine-id.
echo '> Cleaning the machine-id ...'
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# Enables cloud-init
echo '> Enabling cloud-init ...'
echo 'disable_vmware_customization: false' >> /etc/cloud/cloud.cfg