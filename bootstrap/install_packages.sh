#!/usr/bin/env bash

# yes, no accounting for which directory it got called from
# sudo add-apt-repository ppa:fish-shell/nightly-master
sudo apt update

sudo apt install $(< apt_packages.txt)
sudo snap install $(< snap_packages.txt)
sudo snap install slack --classic

