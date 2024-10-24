@echo off

title Configure Firewall

netsh advfirewall import "C:\Users\%USERNAME%\Desktop\CyberPatriot-Firewall.wfw"

netsh advfirewall set allprofiles settings inboundusernotification enable
netsh advfirewall set allprofiles settings remotemanagement disable

netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall set logging allowedconnections enable
netsh advfirewall set logging droppedconnections enable

netsh advfirewall firewall set rule group="remote desktop" new enable=No
netsh advfirewall firewall set rule group="remote assistance" new enable=No
netsh advfirewall firewall set rule name="Core Networking - DNS (UDP-Out)" new dir=out action=allow security=authenticate
netsh advfirewall firewall set rule name="Core Networking - Dynamic Host Configuration Protocol (DHCP-Out)" new dir=out action=allow security=authenticate
call :ruleFunc CoreNetworking-IPv6(IPv6-Out) block
call :ruleFunc CoreNetworking-NeighborDiscoveryAdvertisement(ICMPv6-Out) block
call :ruleFunc CoreNetworking-NeighborDiscoverySolicitation(ICMPv6-Out) block

netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled


call :webRuleFunc www.uscyberpatriot.org 192.235.101.16
call :webRuleFunc challenge.uscyberpatriot.org 3.217.167.106
call :webRuleFunc autodiscover.uscyberpatriot.org 52.97.211.232
call :webRuleFunc scoreboard1.uscyberpatriot.org 54.204.38.205
call :webRuleFunc scoreboard2.uscyberpatriot.org 54.235.154.203
call :webRuleFunc scoreboard.uscyberpatriot.org 54.243.195.23
call :webRuleFunc author.uscyberpatriot.org 192.235.101.9
call :webRuleFunc admin.uscyberpatriot.org 192.235.101.11
call :webRuleFunc api.uscyberpatriot.org 192.235.101.13

call :webRuleFunc www.microsoft.com 23.197.14.39

call :webRuleFunc www.vmware.com1 172.64.154.75
call :webRuleFunc www.vmware.com2 172.64.154.75

call :webRuleFunc support.broadcom1 172.66.0.165
call :webRuleFunc support.broadcom2 162.159.140.167

call :webRuleFunc 7-zip.com 49.12.202.237

call :webRuleFunc canonical.com1 185.125.188.84
call :webRuleFunc canonical.com2 185.125.188.232
call :webRuleFunc canonical.com3 185.125.188.126

call :webRuleFunc ubuntu.com1 185.125.190.29
call :webRuleFunc ubuntu.com2 185.125.190.21
call :webRuleFunc ubuntu.com3 185.125.190.20

call :webRuleFunc winmd5.com 3.212.132.79

call :webRuleFunc netacad.com 18.160.249.19
call :webRuleFunc netacad.com 18.160.249.85
call :webRuleFunc netacad.com 18.160.249.110
call :webRuleFunc netacad.com 18.160.249.76

call :webRuleFunc ​s3.amazonaws.com1 52.217.193.224
call :webRuleFunc ​s3.amazonaws.com2 16.15.177.108
call :webRuleFunc ​s3.amazonaws.com3 54.231.224.152
call :webRuleFunc ​s3.amazonaws.com4 52.216.63.24
call :webRuleFunc ​s3.amazonaws.com5 52.216.102.109
call :webRuleFunc ​s3.amazonaws.com6 16.182.34.112
call :webRuleFunc ​s3.amazonaws.com7 54.231.164.168
call :webRuleFunc ​s3.amazonaws.com8 52.217.231.40

call :webRuleFunc ​rs6.net&r20.​rs6.net 208.75.122.11

call :webRuleFunc ​a.rs6.net1 104.18.43.28
call :webRuleFunc a.rs6.net2 172.64.144.228

call :webRuleFunc google.com 142.250.190.142

call :webRuleFunc 54.243.182.228 54.243.182.228
call :webRuleFunc 54.243.182.235 54.243.182.235
call :webRuleFunc 54.243.223.132 54.243.223.132
call :webRuleFunc 54.243.195.23 54.243.195.23
call :webRuleFunc 54.204.38.205 54.204.38.205
call :webRuleFunc 54.235.154.203 54.235.154.203
call :webRuleFunc 52.202.17.90 52.202.17.90
call :webRuleFunc 3.217.167.106 3.217.167.106


netsh advfirewall firewall add rule name="Open 54.243.182.228 TCP Out" dir=out action=allow protocol=TCP localport=443 remoteport=443
netsh advfirewall firewall add rule name="Open 54.243.182.228 TCP In" dir=out action=allow protocol=TCP localport=443 remoteport=443


pause

:webRuleFunc
  netsh advfirewall firewall add rule name="Allow in from %~1 via port 443" dir=in action=allow protocol=ANY remoteip=%~2 remoteport=443
  netsh advfirewall firewall add rule name="Allow in from %~1 via port 80" dir=in action=allow protocol=ANY remoteip=%~2 remoteport=80
  netsh advfirewall firewall add rule name="Allow out from %~1 via port 443" dir=out action=allow protocol=ANY remoteip=%~2 remoteport=443
  netsh advfirewall firewall add rule name="Allow out from %~1 via port 80" dir=out action=allow protocol=ANY remoteip=%~2 remoteport=443

  exit /b

:ruleFunc
  netsh advfirewall firewall show rule name="%~1" 2>&1
  IF ERRORLEVEL 0 (
    netsh advfirewall firewall set rule name="%~1" new dir=in action=%~2
    netsh advfirewall firewall set rule name="%~1" new dir=out action=%~2
  ) ELSE (
    netsh advfirewall firewall add rule name="%~1" dir=in action=%~2
    netsh advfirewall firewall add rule name="%~1" dir=out action=%~2
  )
  exit /b
