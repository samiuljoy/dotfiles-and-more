#!/bin/sh
if [ $(id -u) = 0 ]; then
	echo "\nSeems like you are root, well, below is a list of packages that will be downloaded"
	echo "\n\t1. Vim"
	echo "\n\t2. Xfce4-terminal"
	echo "\n\t3. i3"
	echo "\n\t4. Font Fira Code"
	echo
	echo "\nChose number/s followed by spaces, say if you wish to install vim and i3, but not xfce4-terminal and fira code font, you would type in 1 s 3 s. s stands for skip"
	echo
	read -p "Chose applications to install " vimm xfterminal iwind firaa
	case "$vimm" in
		"1") which vim
			if [ $? = 0 ]; then
			echo "\nVim seems to be already installed on your system, great!, skipping vim installation"
		else
			echo "Installing vim"
			apt install vim
		fi
			;;
		"s") echo "\nSkipping vim installation"
			;;
		*) echo "Invalid input, skipping vim installation continuing rest of the setup though..."
			;;
	esac

	case "$xfterminal" in
		"2") which xfce4-terminal
			if [ $? = 0 ]; then
			echo "\nXfce4-terminal seems to be already installed on your system, great!, skipping xfce4-terminal installation"
		else
			echo "Installing xfce4-terminal"
			apt install xfce4-terminal
		fi
			;;
		"s") echo "\nSkipping xfce4-terminal installation"
			;;
		*) echo "Invalid input, skipping xfce4-terminal setup, continuing rest of the setup though..."
			;;
	esac

	case "$iwind" in
		"3") which i3
			if [ $? = 0 ]; then
			echo "\nI3 window manager seems to be already installed on your system, great!, skipping i3 installation"
		else
			echo "Installing i3 window manager"
			apt install i3
		fi
			;;
		"s") echo "\nSkipping i3 installation"
			;;
		*) echo "Invalid input, skipping i3 window manager setup, continuing rest of the setup though..."
			;;
	esac
	
	case "$firaa" in
		"4") if [ $(ls /usr/share/font* | grep -i fira | sed 's/://g' ) = "/usr/share/fonts-firacode" ]; then
			echo "\nFira Code font family seems to be already installed on your system, great!, skipping font installation"
		else
			echo "Installing Fira Code font family"
			apt install fonts-firacode
		fi
			;;
		"s") echo "\nSkipping fonts-firacode installation"
			;;
		*) echo "Invalid input, skipping fonts-firacode setup, continuing rest of the setup though..."
			;;
	esac


else
	echo "\nSeems like you dont have root privilege. You need to have root privilege to install packages"
fi
