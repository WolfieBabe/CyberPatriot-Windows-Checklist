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
call :ruleFunc "Core Networking - IPv6 (IPv6-Out)" "block"
call :ruleFunc "Core Networking - Neighbor Discovery Advertisement (ICMPv6-Out)" block
call :ruleFunc "Core Networking - Neighbor Discovery Solicitation (ICMPv6-Out)" block

netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled

call :webRuleFunc uscyberpatriot.org 192.235.101.16
call :webRuleFunc microsoft.com 20.112.250.133
call :webRuleFunc vmware.com 45.60.101.183
call :webRuleFunc 7-zip.com 15.197.142.173
call :webRuleFunc canonical.com 185.125.190.20
call :webRuleFunc ubuntu.com 185.125.190.21
call :webRuleFunc winmd5.com 3.212.132.79
call :webRuleFunc netacad.com 174.129.126.250
call :webRuleFunc ​s3.amazonaws.com 52.216.208.0
call :webRuleFunc ​cyber2 54.243.223.132
call :webRuleFunc cyber1 54.243.182.228

netsh advfirewall firewall add rule name="Open Port 443" dir=out action=allow protocol=TCP localport=443 remoteport=443
netsh advfirewall firewall add rule name="Open Port 443" dir=out action=allow protocol=UDP localport=443 remoteport=443
netsh advfirewall firewall add rule name="Open Port 80" dir=out action=allow protocol=TCP localport=80 remoteport=80 
netsh advfirewall firewall add rule name="Open Port 80" dir=out action=allow protocol=UDP localport=80 remoteport=80

pause

:webRuleFunc
  netsh advfirewall firewall add rule name="Allow in from %~1" dir=in action=allow protocol=ANY remoteip=%~2
  netsh advfirewall firewall add rule name="Allow out from%~1" dir=out action=allow protocol=ANY remoteip=%~2
  exit /b

:rulefunc
  netsh advfirewall firewall show rule name="%~1" 2>&1
  IF ERRORLEVEL 0 (
    netsh advfirewall firewall set rule name="%~1" new dir=in action=%~2
    netsh advfirewall firewall set rule name="%~1" new dir=out action=%~2
  ) ELSE (
    netsh advfirewall firewall add rule name="%~1" dir=in action=%~2
    netsh advfirewall firewall add rule name="%~1" dir=out action=%~2
  )
  exit /b
