#!/bin/bash -eux

# Install VirtualBox guest additions
mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
/mnt/VBoxLinuxAdditions.run || :
umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
