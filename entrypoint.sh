#!/bin/bash
# Copyright (C) 2021 Corexalys.
#
# This file is part of rs3f.
#
# rs3f is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rs3f is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with rs3f.  If not, see <https://www.gnu.org/licenses/>.

set -e

echo
echo "=> Ensure correct permissions for /rs3f_data and create required dirs..."
echo

chown root:root /rs3f_data
chmod 755 /rs3f_data
mkdir -p /rs3f_data/home
chown root:root /rs3f_data/home
chmod 755 /rs3f_data/home
mkdir -p /rs3f_data/chroot
chown root:root /rs3f_data/chroot
chmod 755 /rs3f_data/chroot
mkdir -p /rs3f_data/host_keys
chown root:root /rs3f_data/host_keys
chmod 700 /rs3f_data/host_keys

echo
echo "=> Re-create needed debian accounts..."
echo

load_initial_accounts

echo
echo "=> Generate SSH host keys if needed..."
echo

keytypes=(dsa ecdsa ed25519 rsa)
for keytype in "${keytypes[@]}"; do
    if [ ! -f "/rs3f_data/host_keys/ssh_host_${keytype}_key" ]; then
        echo "${keytype} is missing..."
        ssh-keygen -t ${keytype} -f /rs3f_data/host_keys/ssh_host_${keytype}_key
    else
        echo "${keytype} already present"
    fi
done

echo
echo "=> Start sshd..."
echo

/usr/sbin/sshd -De
