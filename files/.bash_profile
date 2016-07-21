. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'

