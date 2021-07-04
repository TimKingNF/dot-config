@echo off
setlocal enabledelayedexpansion

:: 参考
:: https://blog.niekun.net/archives/1801.html

:: powershell 放开 wsl 网卡的防火墙
:: New-NetFirewallRule -DisplayName "WSL" -Direction Inbound -InterfaceAlias "vEthernet (WSL)" -Action Allow

::不管三七二十一先停掉可能在跑的wsl实例
wsl --shutdown Ubuntu-20.04
::重新拉起来，并且用root的身份，启动ssh服务
wsl -u root service ssh start

:: 看看我要的IP在不在
wsl -u root ip addr | findstr "192.168.120.181" > nul
if !errorlevel! equ 0 (
    echo wsl ip has set
) else (
    ::不在的话给安排上
    wsl -u root ip addr add 192.168.120.181/24 broadcast 192.168.120.0 dev eth0 label eth0:1
    echo set wsl ip success: 192.168.120.181
)


::windows作为wsl的宿主，在wsl的固定IP的同一网段也给安排另外一个IP
ipconfig | findstr "192.168.120.100" > nul
if !errorlevel! equ 0 (
    echo windows ip has set
) else (
    netsh interface ip add address "vEthernet (WSL)" 192.168.120.100 255.255.255.0
    echo set windows ip success: 192.168.120.100
)

pause