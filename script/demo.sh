#!/bin/bash
dir="${HOME}/.vim/dictionary"
#cd ${dir}

if [ "${dir}" == "" -o ! -d "${dir}" ]; then
	echo "The ${dir} is NOT exist in your vim system."
	exit 1
fi

for path in $(find ${dir}/ -name *.jmod)
do
	parentdir="$(dirname ${path})"
	file="${path/[.\/]*\//}"
	filename="${file%.*}"
	extension="${file##*.}"
	echo "path: "${path}
	echo "parent: "${parentdir}
	echo "file: "${file}
	echo "filename: "${filename}
	echo "extension: "${extension}
done

echo "Parse OK!"
exit 0
