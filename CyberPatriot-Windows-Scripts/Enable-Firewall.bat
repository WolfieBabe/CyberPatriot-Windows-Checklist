@echo off

title Configure Firewall

netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall import "C:\Users\%USERNAME%\Desktop\CyberPatriot-Firewall.wfw"

netsh advfirewall set logging allowedconnections enable
netsh advfirewall set logging droppedconnections enable

pause
