# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
 alias zshconfig="sudo nano ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/htl/bin:/usr/lib/ruby:/usr/lib64/ruby"
export PATH="$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/htl/bin"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

autoload zkbd




######################################
# htl aliases
######################################

alias zrc='source ~/.zshrc'

#-------- Alias Command Substitution {{{
#------------------------------------------------------
# replace existing commands with extra flags
alias bc='bc -q -l' # dont show opening msg, use math library
alias cal='cal -3' # show 3 months
alias cp='cp -i' # cp interactive
alias df='df -hT' # human readable, print filetype
alias du='du -h' # max depth, human readable
alias emacs='emacs -nw' # cli mode
alias feh='feh -B white -g 1360x768' # background, resolution
alias free='free -h' # human readable
alias fu='fu -a' # show all results
alias info='info --vi-keys' # GNU info act like man command
alias mkdir='mkdir -p -v' # create if not exist, verbose
alias mv='mv -i' # mv interactive
alias nano='nano' # word wrapping
alias pdfgrep='pdfgrep -in' # ignorecase, page number
alias rm='rm -i' # rm interactive
alias rd='rm -rf' # remove directory
alias sr='sr -browser=$BROWSERCLI' # cli browser
alias wget='wget -c' # continues/resumes
## }}}
#-------- Directory Shortcuts {{{
#------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# quickly cd out of directories using numbers
# usage: up 2 -- same as cd ../../
up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }
#}}}
#-------- Listing Files {{{
#------------------------------------------------------
alias lsd='ls -1d */' # ls folders only
alias l='ls -la'
alias lst='ls -Ggthrc' # list by time and change, newest at bottom
alias lsa='ls -GghA'


# search http://www.commandlinefu.com
# usage: cmdfu mount drives
cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
| sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;}

# display one random command from commandlinefu.com
cmdfu-random() { echo -e "`curl -sL http://www.commandlinefu.com/commands/random/json|sed -re 's/.*,"command":"(.*)","summary":"([^"]+).*/\\x1b[1;32m\2\\n\\n\\x1b[1;33m\1\\x1b[0m/g'`\n" ;}

# check if a website is down
# usage: down4me google.com
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

# url shortener
tiny-isgd() { wget -qO - "http://is.gd/create.php?format=simple&url=$1" ;}

# create qrcode
qrcode() { link=$(echo "http://qrcode.kaywa.com/img.php?s=8&d=$@" | sed 's/ /+/g'); $BROWSER $link ;}


alias rtor="/etc/init.d/rtorrent"

alias du="du -h --max-depth=1"

alias sudo="sudo "

alias htlaria2c='touch /www/aria2/webui-aria2/downloaded/session.txt && aria2c --enable-rpc --rpc-listen-all --save-session=/www/aria2/webui-aria2/downloaded/session.txt --input-file=/www/aria2/webui-aria2/downloaded/session.txt -x16 -s16 -k1M --dir=/www/aria2/webui-aria2/downloaded'

# GIT
alias gtus='git status'
alias gcm='git commit -m '
alias gcam='git commit -am '
alias gco='git checkout'
alias gdi='git diff'
alias gdev='git checkout develop && git merge origin/develop'
alias gfap='git fetch --all -p --tags'
alias gpo='git push origin $(git symbolic-ref --short HEAD)'
alias gdep='git fetch --all; git checkout testing && git reset --hard origin/testing && git merge origin/develop && git push origin testing'
# git latest branches
alias glb='git for-each-ref --sort=-committerdate refs/heads/ | head'
# list of files changed in latest commit
alias glast='git diff-tree --name-only -r --no-commit-id HEAD'

alias ipn3='source /www/ipn/ipn/bin/activate'
alias ipn2='source /www/ipn/ipn2/bin/activate'
