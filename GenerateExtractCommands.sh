#!/usr/bin/env bash
SOURCEDIR="${PWD}"
DESTDIR="${PWD}/extracted"
find "${SOURCEDIR}" -type f -regex '\(.*7[zZ]\|.*[rR][aA][rR]\|*.[zZ][iI][pP]\)' -printf "%f\n"| while read line; do
FILENAME=$(echo $line|sed -r 's/^(.*)(\.)(.*)$/\1/')
FILEEXT=$(echo $line|sed -r 's/^(.*)(\.)(.*)$/\3/')
OUTPUTDIR=${DESTDIR}/${FILENAME}
MAKEDIRCMD="mkdir -p \"${DESTDIR}/${FILENAME}\""
EXTRACTCMD="7z e \"${SOURCEDIR}/$line\" -o\"${OUTPUTDIR}\""
echo "${MAKEDIRCMD} && ${EXTRACTCMD}"
done;
