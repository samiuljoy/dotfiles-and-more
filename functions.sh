vimrc_setup() {
	echo "\n\tConfiguring vimrc setup"
	which vim
	if [ $? = 0 ]; then
		if [ -f "$HOME/.vimrc" ]; then
			echo
			read -p ".vimrc already exist on your home directory, do you want to replace it? [y or n] " vimrc
			case "$vimrc" in
				"y") cat vim/vimrc > $HOME/.vimrc
					echo "\nvimrc replaced"
					;;
				"n") echo "\n$HOME/.vimrc is untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		else
			echo
			read -p "Do you want to copy .vimrc to your $HOME directory? [y or n] " cpvim
			case "$cpvim" in
				"y") cat vim/vimrc > $HOME/.vimrc
					echo "\nvimrc replaced"
					;;
				"n") echo "\nVimrc left untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		fi
	else
		echo "\nvim isn't installed on your system, install vim with apt install vim, .vimrc isn't copied and left for you to manually copy"
	fi
sleep 1
}


bashrc_setup() {
	echo "\n\tConfiguring bashrc"
	sleep 0.5
	which bash
	if [ $? = 0 ]; then
		if [ -f "$HOME/.bashrc" ]; then
			echo
			read -p ".bashrc already exist on your home directory, do you want to replace it? [y or n] " bashrc
			case "$bashrc" in
				"y") cat bashrc > $HOME/.bashrc && cat bash_aliases > $HOME/.bash_aliases
					echo "\nbashrc replaced"
					;;
				"n") echo "\n$HOME/.bashrc is untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		else
			echo
			read -p "Do you want to copy .bashrc to your $HOME directory? [y or n] " cpbash
			case "$cpbash" in
				"y") cat bashrc > $HOME/.bashrc
					echo "\nbashrc replaced"
					;;
				"n") echo "\nbashrc left untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		fi
	else
		echo "\nbash isn't installed on your system, that's odd?"
	fi
sleep 1
}


vim_col() {
	which vim
	if [ $? = 0 ]; then
		echo "\nConfiguring vim colors"
			if [ $(id -u) = 0 ]; then
				chmod 0755 vim-colors/*
				echo "\nCopying vim colors to /usr/share/vim/vim*/colors/"
				cp vim-colors/* /usr/share/vim/vim*/colors/
				if [ $? = 0 ]; then
					echo "\nVim colors copied successfully"
				else
					echo "\nSomething went wrong while copying vim colors"
				fi
				echo "\nColors successfully copied"
			else
				echo "\n\tA note about vim-colorscheme"
				echo "\nYou need to copy the vim colorschemes in vim-colors manually to /usr/share/vim/vim*/colors/ since root privilege is required to make changes to system files."
			fi
		else
			echo "Vim is not installed on your system, you can install vim using apt install vim"
	fi
sleep 0.5
}
# 
# mutt_setup() {
# 	echo "\n\tA note about muttrc setup"
# 	which mutt
# 	if [ $? = 0 ]; then
# 		echo "\nLooks like you have mutt installed on your system, feel free to replace the muttrc configs manually. Mutt configs are stored under mutt/muttrc"
# 	else
# 		echo "\nLooks like Mutt email client is not installed on your system, you can install mutt with apt install mutt."
# 	fi
# sleep 0.5
# }
# 

xfce_setup() {
	echo "\n\tConfiguring xfce4-terminal setup"
	which xfce4-terminal
	if [ $? = 0 ]; then
		echo
		read -p "Do you want to replace your terminalrc config with mine? [y or n] " xfrcon
		case "$xfrcon" in
			"y") cat xfce4/terminalrc > $HOME/.config/xfce4/terminal/terminalrc
				if [ $? = 0 ]; then
					echo "\nTerminalrc replaced successfully"
				else
					echo "Something went wrong while replacing terminalrc"
				fi
				;;
			"n") echo "\nTerminalrc left untouched"
				;;
			*) echo "Invalid input"
				exit 1
				;;
		esac
		if [ $(id -u) = 0 ]; then
			chmod 0755 xfce4/xfce4-colors/*
			echo "\nCopying xfce4-colors"
			cp xfce4/xfce4-colors/* /usr/share/xfce4/terminal/colorschemes/
			if [ $? = 0 ]; then
				echo "\nColors successfully copied"
			else
				echo "\nSomething went wrong...continuing rest of the setup though"
			fi
		else
			echo "\n\tNote about xfce4-terminal colorschemes"
			echo "\nYou need to copy the colorschmes for xfce4-terminal manually from xfce4-colors/ to /usr/share/xfce4/terminal/colorschemes/ because root privilege is needed for modifying system files" 
		fi
	else
		echo "\nXfce4-terminal is not installed on your system, you can install xfce4-terminal with apt install xfce4-terminal"
	fi
sleep 0.5
}


i3_config() {
	echo "\n\tConfiguring i3wm"
	which i3
	if [ $? = 0 ]; then
		if [ -f "$HOME/.config/i3/config" ]; then
			echo
			read -p "A config file for i3 already exist on your home $HOME/.config/i3/config, do you want to replace it with the new one? [y or n] " iwm
			case "$iwm" in
				"y") cat i3/config > $HOME/.config/i3/config
					echo "\ni3 configs replaced"
					;;
				"n") echo "\n$HOME/.config/i3 is left untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		else
			echo
			read -p "Do you want to copy i3 config to $HOME/.config/i3/ [y or n] " cpiw
			case "$cpiw" in
				"y") cat i3/config > $HOME/.config/i3/config
					echo "\ni3 config placed under $HOME/.config/i3/config"
					;;
				"n") echo "\ni3 configs left untouched"
					;;
				*) echo "\nwrong input"
					exit 1
					;;
			esac
		fi
	else
		echo "\n\ni3 window manager isn't installed on your system, install i3 with apt install i3"
	fi
sleep 1
}
