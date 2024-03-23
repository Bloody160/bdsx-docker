#!/bin/sh
cwd=$(pwd)
SCRIPT=$(readlink -f "$0")
cd $(dirname "$SCRIPT")

# remove junk
rm ./bedrock_server/bdsx_shell_data.ini >/dev/null 2>/dev/null

# launch
clear
cd /usr/local/bin/wine
./wine /root/bdsx/bedrock_server/bedrock_server.exe /root/bdsx