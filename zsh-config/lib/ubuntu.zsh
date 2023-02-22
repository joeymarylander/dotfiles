#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

[[ ! "x$SYSTEM" = "xLinux" ]] && return


alias ls='ls --color=auto'

source $HOME/.nix-profile/etc/profile.d/nix.sh
source $HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export EDITOR="nvim"

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"


export PATH=$PYENV_ROOT/bin:$RBENV_ROOT/bin:/sbin:$PATH



eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
