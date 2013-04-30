#!/bin/bash
cd "$1"
echo "
	ant debug &&
	adb -d install -r bin/"$(ProjectName.sh)"-debug.apk &&
	adb -d shell am start "$(PackageName.sh)"/."$(ActivityName.sh)"
" > RUN.sh
chmod  +x RUN.sh

