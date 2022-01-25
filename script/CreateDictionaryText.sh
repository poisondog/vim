#!/bin/bash
dir="${HOME}/.vim/dictionary"
#cd ${dir}

if [ "${dir}" == "" -o ! -d "${dir}" ]; then
	echo "The ${dir} is NOT exist in your vim system."
	exit 1
fi

for path in $(find ${dir}/ -name *.jmod)
do
	${HOME}/.vim/script/CreateJavaApiText.sh ${path}
done
for path in $(find ${dir}/ -name *.jar)
do
	${HOME}/.vim/script/CreateJavaApiText.sh ${path}
done
grep -r 'Compiled from' ${dir}/ > ${HOME}/.vim/dictionary.index
echo "Parse OK!"
exit 0
