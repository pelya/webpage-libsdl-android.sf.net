#!/bin/sh

rm -rf tmp
mkdir tmp

for FF in r/*/* r/* ; do
[ -f "$FF" ] || continue
F=tmp/`basename $FF`
mv $FF $F
#PKG=`aapt dump badging $F | grep "package:" | sed "s/.*name=[']\([^']*\)['].*versionCode=[']\([^']*\)['].*/\1-\2/" | tr " '/" '---'`
PKG=`aapt dump badging $F | grep "package:" | sed "s/.*name=[']\([^']*\)['].*/\1/" | tr " '/" '---'`
VER=`aapt dump badging $F | grep "package:" | sed "s/.*versionName=[']\([^']*\)['].*/\1/" | tr " '/" '---' | grep -o '^[0-9.]*'`
NAME=`aapt dump badging $F | grep "application: label=" | sed "s/.*label=[']\([^']*\)['].*/\1/" | tr " '/" '---'`
echo $NAME: $F $PKG $VER
COUNTER=0
while [ -e r/$NAME/$NAME-${VER}_$COUNTER.apk ]; do
	if cmp r/$NAME/$NAME-${VER}_$COUNTER.apk $F > /dev/null; then
		echo "Identical files:" r/$NAME/$NAME-${VER}_$COUNTER.apk $F
		break
	fi
	COUNTER=`expr $COUNTER '+' 1`
done
mkdir -p r/$NAME
mv -f $F r/$NAME/$NAME-${VER}_$COUNTER.apk
done

for F in r/*/*_0.apk; do
	mv $F `echo $F | sed 's@_0.apk$@.apk@'`
done

rm -rf tmp
echo "all .apk renamed, uploading..."
./upload-apk.sh