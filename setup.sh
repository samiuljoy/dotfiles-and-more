#!/bin/sh
echo "\n\t\t\t\t>>>>>> Welcome! Ready to try out my dotfiles? <<<<<<"
echo "\nYou could either download the required packages automatically with this installation which would require you to have root privilege, or you could run the installer as a non-root user."
echo
echo "Run this installer as a non-root or root? Type in 'nonroot' for running as non-root user, or type in 'asroot' to run it as a root user(without the quotes) "
echo
# I could've used positional arguments, but using variables seems fun (:
read -p "[nonroot or asroot]: " rootorno
case "$rootorno" in
	"asroot") echo "\nRunning this installer as a root user"
		sh requirements.sh
		;;
	"nonroot") echo "\nRunning this installer as a non-root user"
		;;
	"*") echo "\nInvalid key pressed, exiting setup..."
		exit 1
		;;
esac

sleep 0.5
echo "\nProceeding forward..."
cur_dir="$(dirname "$0")"
. $cur_dir/functions.sh
sleep 0.5
echo "\n\n\tChose your preferred config/s"
echo "\n\t1. vimrc config"
echo "\n\t2. bashrc config"
echo "\n\t3. copy vim colors"
echo "\n\t4. xfce4-terminal colorscheme setup"
echo "\n\t5. i3 config setup"
echo
echo "\nChose any number of options followed by spaces, for eg; to set up vimrc, bashrc and i3 you would have to type 1 2 s s 5. Here s stands for skip."
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

case "$xfcec" in
	"4") xfce_setup
		;;
	"s") echo "\nskipping xfce terminal color setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

case "$iwm" in
	"5") i3_config
		;;
	"s") echo "\nskipping i3 config setup"
		;;
	*) echo "\nInvalid number, continuing rest of the setup..."
		;;
esac

sleep 0.5
echo "\n\nFor gtk settings"
echo "\nYou probably need to replace the gtk settings from this directory under gtk-3.0/settings.ini to your $HOME/.config/gtk-3.0/settings.ini"
echo "\nNote that these gtk configs are for gtk-3.0, if you have gtk-version other than 3.0, might have to google a bit, I would suggest Arch wiki."
echo "It's better if you copied the settings.ini yourself."
echo
read -p "Also, would you like to install some packages I use as well [ y or n ] " bonus
case "$bonus" in
	"y") sh bonus.sh
		;;
	"n") echo "\nSkipping bonus package installation"
		;;
	*) echo "Invalid input"
		;;
esac
sleep 0.5
echo "\n\nSettings complete I guess. Do a reboot to see changes."
echo "\n\t\t\t\t>>>>>>>> I appreciate you trying out my dotfiles. Hopefully you'll end up liking it (: <<<<<<<<"
