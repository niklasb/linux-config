HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=100000
setopt appendhistory HIST_IGNORE_DUPS INC_APPEND_HISTORY NO_BEEP

bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt adam1

export EDITOR=vim

alias ls='ls --color=auto'
alias ll='ls -alih'
alias less='less -R'
alias c=clear
alias ag='ag --color -H'
alias reload='. ~/.zshrc'

alias Gs="git status"
alias Gc="git commit"
alias Gcm="git commit -m"
alias Gd="git diff"
alias Gdc="git diff --cached"
alias Gps="git push"
alias Gpl="git pull --rebase"
alias Gco="git checkout"
alias Gl="git log"
alias Gr="git reset"
alias Ga="git add"


function venv_enter() {
  source "$HOME/.virtualenvs/$1/bin/activate"
}
function venv_make() {
  mkdir -p "$HOME/.virtualenvs"
  name="$1"
  shift 1
  virtualenv "$@" "$HOME/.virtualenvs/$name"
}

source ~/.zsh-nvm/zsh-nvm.plugin.zsh
