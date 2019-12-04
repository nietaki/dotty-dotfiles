# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"
# ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
case $TERM in
    xterm*)
        precmd () {
            print -Pn "\e]0;$(shrink_path -t -l)\a"
        }
        ;;
esac

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    shrink-path
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export EDITOR='vim'
export VISUAL='vim'

export PATH="/home/nietaki/.pyenv/bin:$PATH"
export PATH="/home/nietaki/apps:$PATH"
export PATH="/home/nietaki/apps/exercism:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#
#
# export PATH=$PATH:/usr/local/sbin:/snap/bin

eval "$(direnv hook zsh)"

# emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'

# for backend scripts and all-around convenience
alias open=xdg-open

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function exhe () {
  iex -e "require IEx.Helpers; IEx.Helpers.h($argv); :erlang.halt"
}

unsetopt AUTO_CD

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/nietaki/.sdkman"
[[ -s "/home/nietaki/.sdkman/bin/sdkman-init.sh" ]] && source "/home/nietaki/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function backend_console_old () {
  # first arg is the environment name, feat or live
  local pod_name
  pod_name=( $(kubectl get pods -n $1 -o name | egrep 'pod/backend-[0-9a-f]' | head -n 1) )
  echo "connecting to $pod_name in $1 environment"

  kubectl -n $1 exec -it $pod_name -- bash -c "_build/prod/rel/app/bin/app remote_console"
}

function backend_console () {
  local env=( ${1:-feat} )
  local pod_name=( $(kubectl get pods -n $env -l app=backend --field-selector status.phase=Running -o jsonpath="{.items[0].metadata.name}") )
  local command=( ${2:-remote_console} )
  echo "connecting to $pod_name in $env environment and running $command"

  kubectl -n $env exec -it $pod_name -- bash -c "_build/prod/rel/app/bin/app $command"
}

function gitroot () {
  cd $(git rev-parse --show-toplevel)
}

export PATH="/home/nietaki/Android/Sdk/platform-tools:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
