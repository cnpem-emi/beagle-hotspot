#!/bin/bash

echo "BeagleBone Wifi Hotspot setup"
echo "-----------------------------"
echo "Updating package cache and installing bridge-utils..."
apt update
apt install bridge-utils

echo "Disabling tether (disallows SoftAp from starting on boot)..."
sed -i 's/TETHER_ENABLED=yes/TETHER_ENABLED=no/g' /etc/default/bb-wl18xx
echo "Disabling HDMI pins..."
sed -i '/disable_uboot_overlay_video=1/s/^#//g' /boot/uEnv.txt
echo "Mapping config file to daemon config..."
sed -i 's/DAEMON_CONF=""/DAEMON_CONF="/etc/hostapd/hostapd.conf"' /etc/default/hostapd

echo "Configuring network interfaces..."
cat >> /etc/network/interfaces << EOL
allow-hotplug wlan0
iface wlan0 inet manual

allow-hotplug eth0
iface eth0 inet manual

iface br0 inet static
bridge_ports wlan0 eth0
EOL

echo "Copying hostapd config..."
cp hostapd.conf /etc/hostapd/hostapd.conf

echo "Enabling hostapd service..."
systemctl enable hostapd

echo "Done!"
