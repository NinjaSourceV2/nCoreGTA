@echo off
rmdir /s /q cache
TIMEOUT /T 1
start FXServer.exe +exec server.cfg +set onesync on +set onesync legacy +set onesync_enableInfinity 1 +set svgui_disable true +set sv_projectName "Source Ready" "sample"