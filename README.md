# BeagleBone Wireless - Wifi hotspot

Simple scripts to create a wifi hotspot with your Beagle. Tested on Debian 10.3 (2020-04-06)

## Usage

Run as sudo:
1. update_kernel.sh (optional, but recommended)
2. Update the variables in setup_hotpot.sh (address, gateway, network)
3. setup_hotspot.sh
4. Reboot (so that HDMI gets disabled. You can continue without rebooting, but it is not recommended)
