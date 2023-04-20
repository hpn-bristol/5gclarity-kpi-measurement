#!/bin/bash
#University Of Bristol, Smart Internet Lab, 5GCLARITY-Project

# Get WWAN interface index.
ww0=""
ww1=""
counter=0
for FILE in /dev/cdc-wdm*
do
    counter=$((counter + 1))
done

if (( $counter == 1 )); then
    ww0=$(sudo qmicli --device=/dev/cdc-wdm0 --device-open-proxy --get-wwan-iface)
elif  (( $counter == 2 )); then
    ww0=$(sudo qmicli --device=/dev/cdc-wdm0 --device-open-proxy --get-wwan-iface)
    ww1=$(sudo qmicli --device=/dev/cdc-wdm1 --device-open-proxy --get-wwan-iface)
fi

# Assuming LiFi interface name is wlxe894f617d0bb.
#lifi="wlxe894f617d0bb"
lifi=wlx70b3d5959053

# Assuming WiFi interface name is wlp4s0.
wifi="wlp4s0"

# Need to check for the following events:
# - Link UP/DOWN
# - Lost carrier
# - Gained carrier
# - Connected WiFi access point:
# - DHCPv4 address xx.xx.xx.xx/xx via xx.xx.xx.xx
# - First packet arrived on the coresponding interface over MPTCP
usr=$USER
if [[ "$ww0" != "" ]]; then
    (sudo tail -f /var/log/syslog | egrep --line-buffered "$ww0" | tee -a $ww0.log) &
fi
if [[ "$ww1" != "" ]]; then
    (sudo tail -f /var/log/syslog | egrep --line-buffered "$ww1" | tee -a $ww1.log) &
fi

#un-comment the following files for LiFi 

#(sudo tail -f /var/log/syslog | egrep --line-buffered "$lifi" | tee -a $lifi.log) &
#(sudo tcpdump -i "$lifi" -c 5 src 10.68.21.50 | tee -a $lifi.log) &

#un-comment the following files for WiFi

(sudo tail -f /var/log/syslog | egrep --line-buffered "$wifi" | tee -a $wifi.log) &
(sudo tcpdump -i "$wifi" -c 5 src 192.168.111.114 | tee -a $wifi.log) &
