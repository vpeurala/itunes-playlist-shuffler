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
  TEMP_DIR=$(mktemp -d);
  cp ${EXPORTED_PLAYLIST_FILE_NAME} ${TEMP_DIR};
  mac2unix --assume-utf16le --remove-bom -n ${TEMP_DIR}/${EXPORTED_PLAYLIST_FILE_NAME} ${TEMP_DIR}/unix.txt;
  head -n 1 ${TEMP_DIR}/unix.txt > ${TEMP_DIR}/header.txt;
  tail -n +2 ${TEMP_DIR}/unix.txt | sort -R > ${TEMP_DIR}/songs.txt;
  cat ${TEMP_DIR}/header.txt ${TEMP_DIR}/songs.txt;
  rm -rf ${TEMP_DIR};
fi

