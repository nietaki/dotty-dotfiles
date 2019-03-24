#!/usr/bin/env bash
set -x

# yes, no accounting for which directory it got called from

sudo apt install git

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d --branch develop
#TODO checkout develop branch, run dotty to get emacs snippets and .spacemacs

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.0

./install_packages.sh
# add the current user to the docker group so it can talk to the dockers
# usermod -a -G docker $USER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

chsh -s $(which zsh)

## making sure snap apps show up in the menus even though we're using zsh
LINE="emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'"
FILE="/etc/zsh/zprofile"

grep -qF "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
