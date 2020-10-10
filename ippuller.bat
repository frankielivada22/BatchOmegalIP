@echo off
title IP-Puller -Omegal
cls

color a
echo:
set /p tshark="Enter tshark derectory (C:\Program Files\Wireshark): "
echo:
set /p interface="Whats your network interface (Ethernet (E), wi-fi (W), etc): "
if %interface% == "E" goto :seth
if %interface% == "W" goto :swif
echo:
:start
echo Starting...
echo:
cd %tshark%
echo:
start tshark.exe -i %interface% -f udp -Y stun.att.ipv4-xord
timeout /t 2 /NOBREAK >nul

:seth
set interface = "Ethernet"
goto :start

:swif
set interface = "wi-fi"
goto :start
