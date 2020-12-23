#!/bin/sh
if [ $(id -u) = 0 ]; then
	echo "Seems like you are root, well, below is a list of packages I use quite often, pretty much all of them are pretty lightweight"
	echo "\n\t1. Mutt email client"
	echo "\n\t2. Mocp, a terminal based music player"
	echo "\n\t3. Mpv, a media player"
	echo "\n\t4. Ranger, the file manager"
	echo "\n\t5. Ulight, a lightweight web browser"
	echo "\n\t6. Zathura, a pdf viewer"
	echo "\n\t7. Feh image viewer"
	echo "\n\t8. Fuzzy finder fzf"
	echo
	echo "\nChose number/s followed by spaces, say if you wish to install Mutt, Mocp, Mpv, and fzf but not Ranger, Ulight, Zathura, and Feh, you'd have to type in 1 2 3 s s s s 8. s stands for skip"
	echo
	read -p "Chose applications to install " muttt mocpp mpvv raanger ulightt zaathura feehh fzff

	case "$muttt" in
		"1") which mutt >/dev/null
			if [ $? = 0 ]; then
			echo "\nMutt seems to be already installed on your system, great!, skipping mutt installation"
		else
			echo "Installing Mutt"
			apt install mutt
		fi
			;;
		"s") echo "\nSkipping mutt installation"
			;;
		*) echo "Invalid input, skipping mutt email client installation, continuing rest of the setup though..."
			;;
	esac

	case "$mocpp" in
		"2") which mocp >/dev/null
			if [ $? = 0 ]; then
			echo "\nMocp seems to be already installed on your system, great!, skipping mocp installation"
		else
			echo "Installing mocp music player"
			apt install moc
		fi
			;;
		"s") echo "\nSkipping mocp installation"
			;;
		*) echo "Invalid input, skipping moc music player installation, continuing rest of the setup though..."
			;;
	esac

	case "$mpvv" in
		"3") which mpv >/dev/null
			if [ $? = 0 ]; then
			echo "\nMpv seems to be already installed on your system, great!, skipping mpv installation"
		else
			echo "Installing mpv media player"
			apt install mpv
		fi
			;;
		"s") echo "\nSkipping mpv installation"
			;;
		*) echo "Invalid input, skipping mpv installation, continuing rest of the setup though..."
			;;
	esac

	case "$raanger" in
		"4") which raanger >/dev/null
			if [ $? = 0 ]; then
			echo "\nRanger seems to be already installed on your system, great!, skipping ranger installation"
		else
			echo "Installing Ranger file manager"
			apt install ranger
		fi
			;;
		"s") echo "\nSkipping ranger installation"
			;;
		*) echo "Invalid input, skipping ranger installation, continuing rest of the setup though..."
			;;
	esac
	
	case "$ulightt" in
		"5") echo "\nPreparing Ulight browser setup"
			which git >/dev/null
			if [ $? = 0 ]; then
				echo "\nGit seems to be installed on your system, clonning Ulight from https://github.com/samiuljoy/ulight.git"
				git clone https://github.com/samiuljoy/ulight.git
				chown -R $USER:$USER ulight
				if [ $? = 0 ]; then
					echo "Light is successfully placed under the directory you're currently on, to launch Ulight just cd into ulight and type in ./light to run light browser"
				else echo "Something went wrong while clonning light browser, is your network interface up though"
				fi
			else
				read "Git isn't installed on your system, would you like to install git now [ y or n ]" gitt
				case "$gitt" in
					"y") echo "\n Installing git"
						apt install git
						sleep 0.5
						echo "\nClonning ulight browser"
						git clone https://github.com/samiuljoy/ulight.git
						chown -R $USER:$USER ulight
						if [ $? = 0 ]; then
							echo "Light is successfully placed under the directory you're currently on, to launch Ulight, just cd into ulight and type in ./light to run light browser"
						else echo "Something went wrong while installing light browser"
						fi
						;;
					"n") echo "You can install git with apt install git, skipping git and ulight installation"
						;;
					*) echo "Invalid input, skipping git installation"
						;;
				esac
			fi
			;;
		"s") echo "\nSkipping Ulight Browser"
			;;
		*) echo "\nInvalid input, skipping ulight setup"
			;;
	esac

	case "$zaathura" in
		"6") which zathura >/dev/null
			if [ $? = 0 ]; then
			echo "\nGreat! Zathura seems to be installed on your system, skipping zathura installation"
		else
			echo "\nInstalling zathura pdf viewer"
			apt install zathura
		fi
			;;
		"s") echo "\nSkipping zathura installation"
			;;
		*) echo "\nInvalid input, skipping zathura installation"
			;;
	esac
		
	case "$feehh" in
		"7") which feh >/dev/null
			if [ $? = 0 ]; then
			echo "\nFeh seems to be already installed on your system, great!, skipping Feh installation"
		else
			echo "\nInstalling Feh"
			apt install feh
		fi
			;;
		"s") echo "\nSkipping feh installation"
			;;
		*) echo "Invalid input, continuing setup..."
			;;
	esac

	case "$fzff" in
		"8") which fzf >/dev/null
			if [ $? = 0 ]; then
			echo "\nFzf seems to be already installed on your system, great!, skipping Fzf installation"
		else
			echo "\nInstalling Fzf"
			apt install fzf
		fi
			;;
		"s") echo "\nSkipping fzf installation"
			;;
		*) echo "Invalid input, continuing rest of the setup though..."
			;;
	esac
else
	echo "\nSeems like you dont have root privilege. You need to have root privilege to install packages"
fi
