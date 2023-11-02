@echo off

title Disable Guest Account

net user guest /active:no

net user DefaultAccount /active:no

pause