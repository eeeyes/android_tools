#!/bin/bash
REGEX=' \{6\}content=\(.*\)'

#read options
while getopts ":x:a:n:" opt 
do
	case $opt in
		x)
			XML_FILE="$OPTARG"
			;;
		a)
			ATTRI_NAME="$OPTARG"	
			;;
		n)
			NODE_PATH="$OPTARG"
			;;
		\?)
			echo "invalid option $OPTARG"
			exit 1
			;;
		:)
			echo "option $OPTARG need an option"
			exit 1
			;;
	esac
done
echo "dir $NODE_PATH" |
xmllint --shell $XML_FILE |
sed -n "/ \{2\}ATTRIBUTE $ATTRI_NAME/,$ {
		/$REGEX/ !b nothing
		s/$REGEX/\1/	
		p
		q
		:nothing
	}
"
