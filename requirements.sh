if [ $(id -u) = 0 ]; then
	echo "Seems like you are root, well, below is a list of packages that will be downloaded"
	echo "\n\t1. Vim"
	echo "\n\t2. Xfce4-terminal"
	echo "\n\t3. i3"
	echo "\n\t4. Mutt email client"
	echo "\n\t5. Font Fira Code"
	echo
	echo "\nChose number/s followed by spaces, say if you wish to install vim and i3, but not xfce4-terminal, mutt and fira code font, you would type in 1 s 3 s s. s stands for skip"
	echo
	read -p "Chose applications to install" vimm xfterminal iwind muttt firaa
	case "$vimm" in
		"1") if [ $(which vim) = "/usr/bin/vim" ]; then
			echo "\nVim seems to be already installed on your system, great!, skipping vim installation"
		else
			echo "Installing vim"
			apt install vim
		fi
			;;
		"s") echo "\nSkipping vim installation"
			;;
		*) echo "Invalid input, exiting"
			exit 1
			;;
	esac

	case "$xfterminal" in
		"2") if [ $(which xfce4-terminal) = "/usr/bin/xfce4-terminal" ]; then
			echo "\nXfce4-terminal seems to be already installed on your system, great!, skipping xfce4-terminal installation"
		else
			echo "Installing xfce4-terminal"
			apt install xfce4-terminal
		fi
			;;
		"s") echo "\nSkipping xfce4-terminal installation"
			;;
		*) echo "Invalid input, exiting"
			exit 1
			;;
	esac

	case "$iwind" in
		"3") if [ $(which i3) = "/usr/bin/i3" ]; then
			echo "\nI3 window manager seems to be already installed on your system, great!, skipping i3 installation"
		else
			echo "Installing i3 window manager"
			apt install i3
		fi
			;;
		"s") echo "\nSkipping i3 installation"
			;;
		*) echo "Invalid input, exiting"
			exit 1
			;;
	esac
	
	case "$muttt" in
		"4") if [ $(which mutt) = "/usr/bin/mutt" ]; then
			echo "\nMutt seems to be already installed on your system, great!, skipping mutt installation"
		else
			echo "Installing Mutt"
			apt install mutt
		fi
			;;
		"s") echo "\nSkipping mutt installation"
			;;
		*) echo "Invalid input, exiting"
			exit 1
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
		*) echo "Invalid input, exiting"
			exit 1
			;;
	esac


else
	echo "\nSeems like you dont have root privilege. You need to have root privilege to install packages"
fi
