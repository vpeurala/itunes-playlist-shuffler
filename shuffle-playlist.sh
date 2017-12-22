#!/usr/bin/env bash
#
# Shuffles a playlist exported from iTunes.
#
#
if [ -z $1 ]; then
  echo "Missing mandatory argument EXPORTED_PLAYLIST_FILE_NAME.";
  echo "Usage: $0 EXPORTED_PLAYLIST_FILE_NAME";
  exit 2;
else
  EXPORTED_PLAYLIST_FILE_NAME=$1;
  echo "EXPORTED_PLAYLIST_FILE_NAME: ${EXPORTED_PLAYLIST_FILE_NAME}";
fi

