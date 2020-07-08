#!/bin/sh

CUR_DIR=$(pwd)
THE_DIR=$CUR_DIR/.config/thesaurus
MOBY_TXT=mthesaur.txt
ROGET_TXT=roget13a.txt
ZIPFILE_SHA_256="3a54e61dd3b4153313e00c3113bda1e939af505d1336a350a0fd93a80538a6d8"

MOBY_URL="http://www.gutenberg.org/dirs/3/2/0/3202/files.zip"

[ ! -d $THE_DIR ] && mkdir -p $THE_DIR

if [ ! -e $THE_DIR/$MOBY_TXT ] || [ ! -e $THE_DIR/$ROGET_TXT ]
then
  if [ ! -e files.zip ]
  then
    wget $MOBY_URL
    # TODO: checksum
  fi

  unzip files.zip

  # TODO: checksum as well?

  mv files/$MOBY_TXT $THE_DIR
  mv files/$ROGET_TXT $THE_DIR

  rm -f files/*
  rmdir files
fi
