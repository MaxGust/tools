#!/bin/bash

# install libav-tools for avconv

set -e
#set -x

if [[ $# < 1 ]];then
	echo "please input music filename"
	exit 1
fi

SUFFIX="${1##*.}"
NAME=`basename "$1" .${SUFFIX}`
CUENAME="${NAME}.cue"


#ENCODE=`vim ${NAME}.cue  -c 'let $enc = &fileencoding | execute "silent !echo $enc" | q'`
ENCODE=gb18030

echo $SUFFIX
echo "convert '$NAME'"

avconv -i "${NAME}.${SUFFIX}" -b:a 320k "${NAME}.mp3"

echo "cue file encoding: $ENCODE"
iconv -f "$ENCODE" -t utf8 "${CUENAME}" -o "${CUENAME}_utf8.cue"
mp3splt -a -c "${CUENAME}_utf8.cue" "${NAME}.mp3" -o @n-@A-@t -d "${NAME}"

rm "${NAME}.mp3"
