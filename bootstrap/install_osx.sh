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
#brew install rebar
#brew install ruby
#brew install sbt
#brew install spark
brew install unar
brew install unixodbc
brew install vim
brew install wget
brew install wxmac
#brew install zsh
brew install pt
brew install cmatrix
brew install tintin
brew install ispell
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

#brew install emacs-plus
brew install the_silver_searcher 

brew tap caskroom/fonts


#brew tap d12frosted/emacs-plus
#brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
#brew linkapps

# installing cask apps
cat cask_apps.txt | xargs brew cask install
