#!/bin/bash

CYAN='\033[0;36m'
RED_COLOR='\033[0;31m'
RESET_COLOR='\033[0m'

INFO_FLAG="[${CYAN}INFO${RESET_COLOR}]"
ERROR_FLAG="[${RED_COLOR}ERROR${RESET_COLOR}]"


echo -e "${INFO_FLAG} Available bars: "
echo -e "  1. Squarebar"
echo -e "  2. Curvedbar"
echo -e "  3. Neutral curvedbar"
read -p "Type the number of your bar: " type

if [[ $type != "1" && $type != "2" && $type != "3" ]]; then
	echo -e "${ERROR_FLAG} Only numbers 1 and 2 are available"
	exit 1
fi

barpath=""

if [ $type == "1" ]; then barpath="/bars/squarebar"; fi
if [ $type == "2" ]; then barpath="/bars/curvedbar"; fi
if [ $type == "3" ]; then barpath="/bars/neutral_curvedbar"; fi

tmp=$(mktemp -d)

cp -r . $tmp
mv $tmp/$barpath/* $tmp
rm -rf $tmp/bars

if ! test -d ~/.config/devol-polybar; then
	mkdir ~/.config/devol-polybar
fi

cp -r $tmp/* ~/.config/devol-polybar
rm -rf $tmp

echo -e "${INFO_FLAG} Setting Hack Fonts on /usr/share/fonts..."
sudo cp -r ./fonts /usr/share/fonts/

echo -e "${INFO_FLAG} Done!"
echo -e "${INFO_FLAG} Now just execute '~/.config/devol-polybar/launch.sh' or set it on your window manager."
