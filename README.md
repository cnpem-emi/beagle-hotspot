# BeagleBone Wireless - Wifi hotspot

Simple scripts to create a wifi hotspot with your Beagle. Tested on Debian 10.3 (2020-04-06)

## Usage

Run as sudo:
1. update_kernel.sh (optional, but recommended)
2. Update the variables in setup_hotpot.sh (address, gateway, network)
3. setup_hotspot.sh
4. Reboot (so that HDMI gets disabled. You can continue without rebooting, but it is not recommended)

## Performance

### Ping time
30 pings @ 1 Hz to 1.1.1.1 with maximum link quality:

| Measurement    | BeagleBone Hotspot | Regular Wifi Hotspot |
|----------------|--------------------|----------------------|
| Minimum        | 5.798 ms           | 6.775 ms             |
| Average        | 9.074 ms           | 8.506 ms             |
| Maximum        | 11.854 ms          | 10.270 ms            |
| Pop. Std. Dev. | 1.836 ms           | 1.177 ms             |

### Details
- Limited to 2.4 GHz
- When paired with an appropriate antenna, signal quality remains excellent for up to 30 meters in optimal conditions
- Supports WPA3, WPA2, etc
