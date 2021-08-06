#!/bin/bash

mkdir ~/.WineApps
mkdir ~/.WineApps/Adobe-Photoshop

zenity --info --text="Please set the windows version to Windows 10 then Apply and OK"

WINEPREFIX=~/.WineApps/Adobe-Photoshop winecfg

curl -L "https://drive.google.com/uc?export=download&id=11OT-SVz9uBH0X2NWJNl8AO1pjeOS2Za5" > allredist.tar.xz
tar -xf allredist.tar.xz
rm -rf allredist.tar.xz
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
curl -L "https://www.dropbox.com/s/v9u4g00iy1crl8z/AdobePhotoshop2021.tar.xz?dl=1" > AdobePhotoshop2021.tar.xz
tar -xf AdobePhotoshop2021.tar.xz
rm -rf AdobePhotoshop2021.tar.xz


WINEPREFIX=~/.WineApps/Adobe-Photoshop ./winetricks fontsmooth=rgb gdiplus msxml3 msxml6 atmlib corefonts dxvk
WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2010/vcredist_x86.exe /q /norestart

WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2012/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2013/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=~/.WineApps/Adobe-Photoshop wine redist/2019/VC_redist.x86.exe /install /quiet /norestart

WINEPREFIX=~/.WineApps/Adobe-Photoshop sh setup_vkd3d_proton.sh install
mkdir ~/.WineApps/Adobe-Photoshop/drive_c/Program\ Files/Adobe
mv Adobe\ Photoshop\ 2021 ~/.WineApps/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021
mv launcher.sh ~/.WineApps/Adobe-Photoshop/drive_c
mv photoshop.png ~/.local/share/icons
mv photoshop.desktop ~/.local/share/applications

rm -rf redist
rm -rf winetricks
rm -rf winetricks.1
rm -rf x86
rm -rf x64
rm -rf setup_vkd3d_proton.sh
zenity --info --text="Installation finished, Have fun with Photoshop !"