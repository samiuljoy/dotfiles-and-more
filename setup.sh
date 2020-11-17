cur_dir="$(dirname "$0")"
. $cur_dir/functions.sh
echo "\n\t\t\t\t>>>>>> Welcome! Ready to try out my dotfiles? <<<<<<"
echo "\n\n\tChose your preferred config/s"
echo "\n\t1. vimrc config"
echo "\n\t2. bashrc config"
echo "\n\t3. copy vim colors"
echo "\n\t4 mutt email client config"
echo "\n\t5. xfce4-terminal colorscheme setup"
echo "\n\t6. i3 config setup"
echo
echo "\nChose any number of options followed by spaces, for eg; to set up vimrc bashrc i3 you would have to type 1 2 s s s 6. Here s stands for skip."
echo
read -p "Enter your number sequence: " vimrc baashrc vcolors email xfcec iwm

case "$vimrc" in
	"1") vimrc_setup
		;;
	"s") echo "\nskipping vimrc config setup"
		;;
	*) echo "\nInvalid number continuing rest of the setup..."
		;;
esac

case "$baashrc" in
	"2") bashrc_setup
		;;
	"s") echo "\nskipping bashrc config setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

case "$vcolors" in
	"3") vim_col
		;;
	"s") echo "\nskipping vim color setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

case "$email" in
	"4") mutt_setup
		;;
	"s") echo "\nskipping mutt config setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

case "$xfcec" in
	"5") xfce_colo_setup
		;;
	"s") echo "\nskipping xfce terminal color setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

case "$iwm" in
	"6") i3_config
		;;
	"s") echo "\nskipping i3 config setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

sleep 0.5
echo "\n\nFor gtk settings"
echo "\n\nYou probably need to replace the gtk settings from this directory under gtk-3.0/settings.ini to your $HOME/.config/gtk-3.0/settings.ini"
echo "\n\nNote that these gtk configs are for gtk-3.0, if you have gtk-version other than 3.0, might have to google a bit, I would suggest Arch wiki."
echo "It's better if you copied the settings.ini yourself."

sleep 0.5
echo "\n\nThe font Fira Code can be installed using apt install fonts-firacode"
echo

sleep 0.5
echo "\n\nSettings complete I guess. Do a reboot to see changes."
echo "\n\t\t\t\t>>>>>>>> I appreciate you trying out my dotfiles. Hopefully you'll end up liking it (: <<<<<<<<"
