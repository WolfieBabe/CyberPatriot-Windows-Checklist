@echo off

title Configure Firewall

netsh advfirewall import "C:\Users\%USERNAME%\Desktop\CyberPatriot-Firewall.wfw"

netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall set logging allowedconnections enable
netsh advfirewall set logging droppedconnections enable

netsh advfirewall firewall set rule group="remote desktop" new enable=No
netsh advfirewall firewall set rule name="Core Networking - DNS (UDP-Out)" new dir=out action=allow
netsh advfirewall firewall set rule name="Core Networking - Dynamic Host Configuration Protocol (DHCP-Out)" new dir=out action=allow
netsh advfirewall firewall set rule name="Core Networking - IPv6 (IPv6-Out)" new dir=out action=block
netsh advfirewall firewall set rule name="Core Networking - IPv6 (IPv6-Out)" new dir=in action=block
netsh advfirewall firewall set rule name="Core Networking - Neighbor Discovery Advertisement (ICMPv6-Out)" new dir=out action=block
netsh advfirewall firewall set rule name="Core Networking - Neighbor Discovery Advertisement (ICMPv6-Out)" new dir=in action=block
netsh advfirewall firewall set rule name="Core Networking - Neighbor Discovery Solicitation (ICMPv6-Out)" new dir=out action=block
netsh advfirewall firewall set rule name="Core Networking - Neighbor Discovery Solicitation (ICMPv6-Out)" new dir=in action=block

netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled

pause
