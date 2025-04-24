#!/bin/sh

rsync -avP -e ssh * "pelya@web.sourceforge.net:/home/project-web/libsdl-android/htdocs/"

# List the server directory
#rsync -avP -e ssh "pelya@web.sourceforge.net:/home/project-web/libsdl-android/htdocs/"
