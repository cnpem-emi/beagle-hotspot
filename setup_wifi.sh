#!/bin/bash

# Works better on wlan0 without tether, which is redundant anyway
sed -i 's/TETHER_ENABLED=yes/TETHER_ENABLED=no/g' /etc/default/bb-wl18xx 
# HDMI can cause lost packets and ping issues
sed -i '/disable_uboot_overlay_video=1/s/^#//g' /boot/uEnv.txt
# Setup config file for hostapd daemon
sed -i 's/DAEMON_CONF=""/DAEMON_CONF="/etc/hostapd/hostapd.conf"' /etc/default/hostapd 

cp hostapd.conf /etc/hostapd/hostapd.conf

systemctl enable hostapd
