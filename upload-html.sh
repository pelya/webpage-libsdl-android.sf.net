#!/bin/sh

bind-wlan0 \
sftp -b batch.sftp "pelya@web.sourceforge.net:/home/project-web/libsdl-android/"
