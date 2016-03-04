#!/bin/bash
dir="JavaImp/java"

if [ "${dir}" == "" -o ! -d "${dir}" ]; then
	echo "The ${dir} is NOT exist in your vim system."
	exit 1
fi

filelist=$(ls ${dir})        # 列出所有在該目錄下的檔案名稱
for filename in ${filelist}
do
	extension="${filename##*.}"
	filename="${filename%.*}"
	if [ "${extension}" == "jar" ]; then
		jar tf ${dir}/${filename}.${extension} | sed -e 's#^src/##' > ${dir}/${filename}.jmplst
		rm ${dir}/${filename}.${extension}
	fi
done
