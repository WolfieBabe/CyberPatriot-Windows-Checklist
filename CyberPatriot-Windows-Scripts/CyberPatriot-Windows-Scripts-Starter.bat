@echo off

call %UserProfile%\Desktop\Enable-Firewall.bat
call %UserProfile%\Desktop\Security-Policy.bat
call %UserProfile%\Desktop\Disable-Guest-Account.bat
call %UserProfile%\Desktop\Services-Configuration.bat
call %UserProfile%\Desktop\Disable-Guest-Account.bat
call %UserProfile%\Desktop\Auto-Update.bat

pause
