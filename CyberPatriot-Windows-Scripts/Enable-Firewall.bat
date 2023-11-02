@echo off

title Configure Firewall

netsh advfirewall import "C:\Users\%USERNAME%\Desktop\CyberPatriot-Firewall.wfw"

netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall set logging allowedconnections enable
netsh advfirewall set logging droppedconnections enable

netsh advfirewall firewall set rule group="remote desktop" new enable=No
netsh advfirewall firewall set rule name="Core Networking (DNS-Out)" dir=out action=allow protocol=UDP remoteport=53 program="c:\windows\system32\svchost.exe" service="dnscache"
netsh advfirewall firewall add rule name="Core Networking (DHCP-Out)" dir=out action=allow protocol=UDP localport=68 remoteport=67 program="c:\windows\system32\svchost.exe" service="dhcp"netsh interface teredo set state disabled


pause
