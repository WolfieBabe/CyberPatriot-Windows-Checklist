@echo off

title Local Security Policy

secedit /configure /db secedit.sdb /cfg "C:\Users\%USERNAME%\Desktop\CyberPatriot-LSP.inf"

pause