#!/bin/sh

# This script has been donated to the public domain 2022 by Sam Trenholme

# A make implementation shouldn't need make to compile

if [ -z "$CC" ] ; then
  CC=cc
fi

if [ -z "$CFLAGS" ] ; then
  CFLAGS=-O2
fi

for a in *.c ; do
  echo $CC $CFLAGS -c -o ${a%.c}.o $a
  $CC $CFLAGS -c -o ${a%.c}.o $a
done

echo $CC $CFLAGS -o maramake *.o
$CC $CFLAGS -o maramake *.o
