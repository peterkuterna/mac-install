echo
echo "Installing Java Development tools"

echo
brew tap AdoptOpenJDK/openjdk # add openjdk tap

echo "Installing Java 8"
brew cask install adoptopenjdk/openjdk/adoptopenjdk8   # install most commonly production used Java version
echo "Installing Java 11"
brew cask install adoptopenjdk11   # install latest LTS Java version
echo "Installing Java 14"
brew cask install adoptopenjdk14   # install latest Java version

echo
echo "Installing jenv to support multiple Java versions"
brew install jenv # Support multiple Java versions (https://www.jenv.be/)

# jenv for bash
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >>~/.bashrc
echo 'eval "$(jenv init -)"' >>~/.bashrc
# jenv for fish
mkdir -p ~/.config/fish
echo 'set PATH $HOME/.jenv/bin $PATH' >> ~/.config/fish/config.fish
echo 'status --is-interactive; and source (jenv init -|psub)' >> ~/.config/fish/config.fish
mkdir -p ~/config/fish/functions
cp /usr/local/opt/jenv/libexec/fish/jenv.fish ~/.config/fish/functions/jenv.fish
cp /usr/local/opt/jenv/libexec/fish/export.fish ~/.config/fish/functions/export.fish

source ~/.bashrc

jenv doctor

# Force jenv to update JAVA_HOME
jenv enable-plugin export

brew install maven      # Leading Java build tool
brew install gradle     # Alternative Java build tool

# link jenv with maven
jenv enable-plugin maven

for jdk in /Library/Java/JavaVirtualMachines/*/; do
  if [[ -d $jdk ]]; then
    jenv add ${jdk}Contents/Home
    ## ERROR : needed to	- customize the PATH export to include brew paths
    ### path export export PATH="$HOME/.jenv/bin:$HOME/bin:/usr/local/bin:$PATH"
  fi
done

# Set Java 8 as default
jenv global 1.8

jenv doctor

brew cask install visualvm # VisualVM

