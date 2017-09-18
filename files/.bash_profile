export PATH=~/Library/Python/2.7/bin:$PATH

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "; echo -ne "\033]0;${PWD##*/}\007"'

# Piece-by-Piece Explanation:
# the if condition makes sure we only screw with $PROMPT_COMMAND if we're in an iTerm environment
# iTerm happens to give each session a unique $ITERM_SESSION_ID we can use, $ITERM_PROFILE is an option too
# the $PROMPT_COMMAND environment variable is executed every time a command is run
# see: ss64.com/bash/syntax-prompt.html
# we want to update the iTerm tab title to reflect the current directory (not full path, which is too long)
# echo -ne "\033;foo\007" sets the current tab title to "foo"
# see: stackoverflow.com/questions/8823103/how-does-this-script-for-naming-iterm-tabs-work
# the two flags, -n = no trailing newline & -e = interpret backslashed characters, e.g. \033 is ESC, \007 is BEL
# see: ss64.com/bash/echo.html for echo documentation
# we set the title to ${PWD##*/} which is just the current dir, not full path
# see: stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-bash-script
# then we append the rest of $PROMPT_COMMAND so as not to remove what was already there
# voilà!


# ego booster script
# not-escaped version:
#  git ls-files -z | xargs -0n1 git blame -wc | sed -e 's/^.\{8\}[^a-zA-Z]*\([a-zA-Z][^+]*\)[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].*$/\1/' | sort -f | uniq -c | sort -rn
#alias ego='git ls-files -z | xargs -0n1 git blame -wc | sed -e '\''s/^.\{8\}[^a-zA-Z]*\([a-zA-Z][^+]*\)[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].*$/\1/'\'' | sort -f | uniq -c | sort -rn'

# requires brew install git-extras
alias ego='git line-summary'

alias nethack='telnet eu.un.nethack.nu'
alias discworld='tt++ ~/.tin/discworld.tin'

base64_decoded() {
  echo -n "$1" | base64 -D && echo
}

base64_encoded() {
  echo -n "$1" | base64 && echo
}

alias decoded=base64_decoded
alias encoded=base64_encoded

alias reseed='mix ecto.drop && mix ecto.create && mix ecto.migrate && mix mainframe.db.seed'

grab_local_schema() {
  graphql-fetch-schema -s -g "http://localhost:4000/api/graphql?username=jacek&password=secret"
}

grab_master_schema() {
  graphql-fetch-schema -s -g "https://mainframe-testing.herokuapp.com/api/graphql?username=jacek&password=secret"
}

set -o vi

alias spc='emacs . &'

export NVM_DIR="/Users/nietaki/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias jsonify='(cd ~/repos/toolbex/ && mix compile && mix run -e Toolbex.json_from_clipboard)'

alias purge_emacs_cache='rm -rf /Users/nietaki/.emacs.d/.cache/*'
