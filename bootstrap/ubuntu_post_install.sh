#!/usr/bin/env zsh
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang 21.2
asdf install elixir 1.8.1-otp-21
asdf install elixir 1.7.4-otp-21
pyenv install 3.7.0
pyenv global 3.7.0
