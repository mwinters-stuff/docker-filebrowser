#!/bin/sh
rm *.tar.gz filebrowser
FILE="linux-arm64-filebrowser.tar.gz"
EXE="filebrowser"
VERSION="$(curl -s https://api.github.com/repos/filebrowser/filebrowser/releases/latest | grep -o '"tag_name": ".*"' | sed 's/"//g' | sed 's/tag_name: //g')"
echo "${VERSION}"
URL="https://github.com/filebrowser/filebrowser/releases/download/$VERSION/$FILE"
curl -fsSL "$URL" -o $FILE || exit 1

tar -zxf $FILE $EXE || exit 1

chmod a+x $EXE || exit 1
rm *.tar.gz