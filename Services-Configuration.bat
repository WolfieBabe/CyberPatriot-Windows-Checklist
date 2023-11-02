@echo off

title Services Configuration

sc config EventLog start= auto
sc start EventLog

sc config upnphost start= disabled
sc stop upnphost

sc config XboxNetApiSvc start= disabled
sc stop XboxNetApiSvc

sc config XblGameSave start= disabled
sc stop XblGameSave

sc config XblAuthManager start= disabled
sc stop XblAuthManager

sc config SessionEnv start= disabled
sc stop SessionEnv

sc config RemoteRegistry start= disabled
sc stop RemoteRegistrycls

sc config ftpsvc start= disabled
sc stop ftpsvc

sc config mnmsrvc start= disabled
sc stop mnmsrvc

sc config WinRM start= disabled
sc stop WinRM

sc config tlntsvr start= disabled
sc stop tlntsvr

pause