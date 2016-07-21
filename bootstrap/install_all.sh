#!/bin/bash
brew update
brew doctor
brew upgrade

brew tap caskroom/cask

brew install ack
brew install gpg 
brew install boost
brew install coreutils
brew install csshx
brew install git
brew install htop-osx
brew install hub
#brew install kdiff3
brew install libxslt
brew install llvm
brew install midnight-commander
brew install openjpeg
brew install postgresql
brew install python
brew install rebar
brew install ruby
brew install sbt
#brew install spark
brew install unar
brew install unixodbc
brew install vim
brew install wget
brew install wxmac
#brew install zsh

# installing cask apps
cat cask_apps.txt | xargs brew cask install
