#!/bin/bash
path=$1
parentdir="$(dirname ${path})"
file="${path/[.\/]*\//}"
filename="${file%.*}"
extension="${file##*.}"
echo ${filename}
if [ "${extension}" == "jar" ] || [ "${extension}" == "jmod" ]; then
	mkdir -p /tmp/${filename}-tmp/
	unzip ${parentdir}/${filename}.${extension} -d /tmp/${filename}-tmp/
	find /tmp/${filename}-tmp/ -name '*.class' | xargs javap -p > ${parentdir}/${filename}.txt
	rm -rf /tmp/${filename}-tmp/
	rm ${parentdir}/${filename}.${extension}
fi
exit 0
