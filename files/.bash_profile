# added by Anaconda2 2.5.0 installer
export PATH="/Users/nietaki/anaconda/bin:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'

# ego booster script
# not-escaped version:
#   git ls-files -z | xargs -0n1 git blame -w | ruby -n -e '$_ =~ /^.*\((.*?)\s[\d]{4}/; puts $1.strip' | sort -f | uniq -c | sort -rn | head -n 10
alias ego='git ls-files -z | xargs -0n1 git blame -w | ruby -n -e '\''$_ =~ /^.*\((.*?)\s[\d]{4}/; puts $1.strip'\'' | sort -f | uniq -c | sort -rn | head -n 10'

alias nethack='telnet eu.un.nethack.nu'

base64_decoded() {
  echo "$1" | base64 -D && echo
}

alias decoded=base64_decoded

grab_local_schema() {
  graphql-fetch-schema "http://localhost:4000/api/graphql?username=ryan&password=secret"
}

grab_master_schema() {
  graphql-fetch-schema "https://mainframe-testing.herokuapp.com/api/graphql?username=ryan&password=secret"
}

set -o vi

