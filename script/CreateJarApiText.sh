#!/bin/bash
dir="${HOME}/.vim/dictionary"
#cd ${dir}

if [ "${dir}" == "" -o ! -d "${dir}" ]; then
	echo "The ${dir} is NOT exist in your vim system."
	exit 1
fi

filelist=$(ls ${dir})        # 列出所有在該目錄下的檔案名稱
for filename in ${filelist}
do
	extension="${filename##*.}"
	filename="${filename%.*}"
	echo ${filename}
	if [ "${extension}" == "jar" ]; then
		mkdir -p /tmp/${filename}-tmp/
		unzip ${dir}/${filename}.${extension} -d /tmp/${filename}-tmp/
		find /tmp/${filename}-tmp/ -name '*.class' | xargs javap -p > ${dir}/${filename}.txt
		rm -rf /tmp/${filename}-tmp/
		rm ${dir}/${filename}.${extension}
	fi
done
echo "Parse OK!"
exit 0
