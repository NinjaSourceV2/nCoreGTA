@echo off
rmdir /s /q cache
TIMEOUT /T 1
start FXServer.exe +exec server.cfg +set onesync legacy +set svgui_disable true +set sv_projectName "Source Ready" "sample"