@echo off
title IP-Puller -Omegal
cls

color a
echo:
set /p tshark="Enter tshark derectory (Eg. -->> E:\Program Files\Wireshark): "
echo Directory set to %tshark%
echo:
set /p interface="Whats your network interface (Ethernet (E), wi-fi (W), etc): "
if "%interface%" == "E" goto :seth
if "%interface%" == "W" goto :swif
echo:
goto :start

::::::::::::::::::::::::::::::::::::::
:seth
set interface = "Ethernet"
goto :start

:swif
set interface = "wi-fi"
goto :start
::::::::::::::::::::::::::::::::::::::

:start
echo Starting...
echo:
cd %tshark%
echo:
start tshark.exe -i %interface% -f udp -Y stun.att.ipv4-xord &
timeout /t 2 /NOBREAK >nul

:top
echo Logging peoples ips, [you can close me if you want :) ]
goto :top

