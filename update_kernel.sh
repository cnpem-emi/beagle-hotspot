#!/bin/bash

apt remove c9-core-installer npm nodejs
apt autoremove
apt update
apt upgrade

cd /opt/scripts
git pull
tools/update_kernel.sh

shutdown -r now
