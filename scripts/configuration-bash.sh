echo
echo "Configuring bash with bash-it"
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
rm -rf ~/.bash_it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it

cp files/custom.aliases.bash ~/.bash_it/aliases/custom.aliases.bash

~/.bash_it/install.sh
# Reload bash config
#source ~/.bash_profile
