#!/bin/sh
rsync -e ssh --partial --progress -h --append-verify --timeout 10 -a -v r/ "pelya@frs.sourceforge.net:/home/frs/project/l/li/libsdl-android/apk"
