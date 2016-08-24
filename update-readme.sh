#!/bin/bash
if [ $(dpkg-query -W -f='${Status}' pandoc 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	echo "Pandoc not found! Install? (y/n) \c"
	read
	if "$REPLY" = "y"; then
		sudo apt-get install command
	fi
else
	echo "Updating README.md"
fi

outputFile="README.md"
pandoc -s curriculum/alex-en.tex -o $outputFile

header="# Curriculum Vitae
> last update $(date +'%d/%m/%Y')
"

echo "$header" | cat - $outputFile > temp && mv temp $outputFile
