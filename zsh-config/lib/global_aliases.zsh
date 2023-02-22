#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# Define common system-wide configurations

# GNU ls aliases
alias ll='ls -lFh'     			# long (-l), types classify (-F),human readable (-h)
alias l='ll'
alias la='ls -lAFh'
alias ls.sort.time='ls -tlFh'
alias ls.sort.size='ls -SlFh'
alias ls.dot='ls -ld .*'		# show dot files, list dirs non-recursively (-d)
alias ls.recursive='ls -R'
alias ls.id='ls -nFh'			# show numeric FID and GID (-n)

# diff
alias diff='colordiff'

# change dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../..'

alias df='df -h'
alias :q='exit'
alias ws='cd ~/workspaces/'


#
# Pipe Aliases
#
alias rg='rg --color=auto '
alias grep='rg --color=auto '
alias egrep='rg --color=auto '
alias -g L=' | less '
alias -g G=' | rg --color=auto '
alias -g T=' | tail '
alias -g H=' | head '
alias -g W=' | wc -l '
alias -g S=' | sort '

function handle-multi-arguments(){
	if [ ! "$#" -gt 1 ] ; then
	  echo "Usage: $0 file1 file2 ..." >&2
	  return -1
	fi
	for file in $@; do
		if [ -f $file ] ; then
			echo -n $file
		fi
	done
	echo 'Done!'
}

# 
# vim
#
alias vim=nvim
alias v=nvim
alias vi=nvm


unset_aws_creds(){
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
}

assume-role() {
    creds=$(aws sts assume-role --role-arn $1 --role-session-name "$USER-assume" --query Credentials)
    export AWS_ACCESS_KEY_ID=$(echo $creds | jq -r ".AccessKeyId")
    export AWS_SECRET_ACCESS_KEY=$(echo $creds | jq -r ".SecretAccessKey")
    export AWS_SESSION_TOKEN=$(echo $creds | jq -r ".SessionToken")
    aws sts get-caller-identity
}

# tmux
alias ta='tmux -2 attach -t main || tmux -2 new -s main'
alias td='tmux detach'


#
# Git
#
alias g=git
alias gsa="git status"
alias glo="git log --oneline"

