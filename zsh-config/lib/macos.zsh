#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#
# Check if running on macOS, otherwise stop here
[[ ! "x$SYSTEM" == "xDarwin" ]] && return

#


# /etc/zprofile is loaded and invokes
# /usr/libexec/path_helper that might slow down start-up.
# Better enter directly the content of /etc/paths.d here

# /etc/paths.d/40-XQuartz
export PATH=$PATH:/opt/X11/bin

#
# GNU Core Utils
# brew info coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
alias ls='gls --color=auto'

# scutil
#
alias sys.get.computername='scutil --get ComputerName'
alias sys.get.localhostname='scutil --get LocalHostName'
alias sys.get.hostname='scutil --get HostName'
alias sys.get.dns='scutil --dns'
alias sys.get.proxy='scutil --proxy'
alias sys.get.network.interface='scutil --nwi'

#
alias sys.uti.file='mdls -name kMDItemContentTypeTree '

alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'
#
# OS X's launchctl
#
alias launch.list='launchctl list '
alias launch.load='launchctl load '
alias launch.unload='launchctl unload '
alias launch.getenv='launchctl getenv '
alias launch.start='launchctl start '
alias launch.stop='launchctl stop '

alias sys.pkg.list='pkgutil --pkgs'

# show CPU info
alias sys.cpu='sysctl -n machdep.cpu.brand_string'
