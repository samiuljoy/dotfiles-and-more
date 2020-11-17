vimrc_setup() {
	echo "\n\tConfiguring vimrc setup"
	if [ $(which vim) = "/usr/bin/vim" ]; then
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
		echo "\nvim isn't installed on your system, install vim with apt install vim"
	fi
sleep 1
}


bashrc_setup() {
	echo "\n\tConfiguring bashrc"
	sleep 0.5
	if [ $(which bash) = "/usr/bin/bash" ]; then
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
	echo "\n\tA note about vim-colorscheme"
	echo "\nYou need to copy the vim colorschemes in vim-colors manually to /usr/share/vim/vim*/colors/ since root privilege is required to make changes to system files."
sleep 0.5
}

mutt_setup() {
	echo "\n\tA note about muttrc setup"
	if [ $(which mutt) = "/usr/bin/mutt" ]; then
		echo "\nLooks like you have mutt installed on your system, feel free to replace the muttrc configs manually. Mutt configs are stored under mutt/muttrc"
	else
		echo "\nLooks like Mutt email client is not installed on your system, you can install mutt with sudo apt install mutt."
	fi
sleep 0.5
}


xfce_colo_setup() {
	echo "\n\tA note about xfce4-terminal colorschemes"
	echo "\nConfiguring xfce4-terminal colorschme"
	if [ $(which xfce4-terminal) = "/usr/bin/xfce4-terminal" ]; then
		echo "\nYou need to copy the colorschmes for xfce4-terminal manually from xfce4-colors/ to /usr/share/xfce4/terminal/colorschemes/ because root privilege is needed for modifying system files" 
		sleep 0.5
	else
		echo "\nxfce4-terminal isn't installed on your system"
	fi
sleep 0.5
}


i3_config() {
	echo "\n\tConfiguring i3wm"
	if [ $(which i3) = "/usr/bin/i3" ]; then
		if [ -f "$HOME/.config/i3/config" ]; then
			echo
			read -p "A config file for i3 already exist on your home directory/i3/config, do you want to replace it? [y or n] " iwm
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
