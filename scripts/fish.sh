echo
echo "Installing fish"

# install fish
brew install fish

# add fish shell
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells

# make fish defautl shell
chsh -s /usr/local/bin/fish

# install oh my fish
curl -L http://get.oh-my.fish > fish_install
fish fish_install --noninteractive --yes
rm fish_install
