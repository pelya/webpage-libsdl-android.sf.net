#!/bin/sh
rsync -e ssh --partial --progress -h --append-verify --timeout 10 -a -v limesurvey/ "pelya@web.sourceforge.net:/home/project-web/libsdl-android/htdocs/limesurvey/"
