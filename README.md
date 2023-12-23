# Realtek-RTL8821CU
Realtek RTL8821CU Driver Source

# Notes
This driver source has been modified as extensively as possible for stability.

# Installation guide
```bash
git clone https://github.com/wildyrando/Realtek-RTL8821CU.git
cd Realtek-RTL8821CU
bash install.sh
```
then reboot your device

# detect as rtl8188gu and cdrom mode ?
run this command
```bash
usb_modeswitch -KW -v 0bda -p 1a2b
```

# set it as permanent
## edit usb_modswitch rules
```bash
nano /lib/udev/rules.d/40-usb_modeswitch.rules
```

## add this line
```bash
ATTR{idVendor}=="1234", ATTR{idProduct}=="5678", RUN+="/usr/sbin/usb_modeswitch -K -v 1234 -p 5678"
```

### Make sure you change the ATTR id vendor value from default to the actual idVendor value, and also ensure that the idProduct value matches the output in lsusb.
### for example in my usbwifi the output from lsusb
#### Bus 001 Device 002: ID 0bda:1a2b Realtek Semiconductor Corp. RTL8188GU 802.11n WLAN Adapter (Driver CDROM Mode)

then in my configuration should like this
```bash
ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="/usr/sbin/usb_modeswitch -K -v 0bda -p 1a2b"
```
