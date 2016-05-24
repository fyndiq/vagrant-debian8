#!/bin/bash -eux

# Removing leftover leases and persistent rules
rm /var/lib/dhcp/*

# Clean out apt cache, lists, and autoremove any packages.
rm -f /var/lib/apt/lists/lock
rm -f /var/lib/apt/lists/*_*
rm -f /var/lib/apt/lists/partial/*
apt-get -y autoremove
apt-get -y clean

# Remove logs from initialization.
rm -f /var/log/*.log /var/log/*.gz /var/log/dmesg*
rm -fr /var/log/syslog /var/log/upstart/*.log /var/log/{b,w}tmp /var/log/udev

# Get rid of bash history.
rm -f $HOME/.bash_history

# Zero out the free space to save space in the final image, blocking 'til
# written otherwise, the disk image won't be zeroed, and/or Packer will try to
# kill the box while the disk is still full and that's bad.  The dd will run
# 'til failure, so (due to the 'set -e' above), ignore that failure.  Also,
# really make certain that both the zeros and the file removal really sync; the
# extra sleep 1 and sync shouldn't be necessary, but...)
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M || true; sync; sleep 1; sync
rm -f /EMPTY; sync; sleep 1; sync
