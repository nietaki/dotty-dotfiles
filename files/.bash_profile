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

