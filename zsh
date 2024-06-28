# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc: executed by zsh for non-login shells.
ZSH_THEME="powerlevel10k/powerlevel10k"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable command history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# Set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Custom aliases
alias ll='ls -la'          # Long listing with hidden files
alias la='ls -A'           # List all files except . and ..
alias l='ls -CF'           # Classify files by adding indicator characters

# Custom prompt
PROMPT='%F{green}%n@%m %F{yellow}%~%f %# '

# Custom functions
# Example: Quick directory navigation
function cdd() {
  cd ~/Documents/$1
}

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Docker aliases
alias dkrstp='docker stop $(docker ps -a -q)'
alias dkrrm='docker rm $(docker ps -a -q)'

# Load .zshrc_custom if it exists
if [ -f ~/.zshrc_custom ]; then
    . ~/.zshrc_custom
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
