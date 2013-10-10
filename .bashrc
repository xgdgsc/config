#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim PKGBUILD'
alias vs='vim SPLITBUILD'
alias ec='emacsclient'
alias svnconflict="svn status | grep -P '^(?=.{0,6}C)'"
alias rscp='rsync -v -P -a -z -e ssh'
#Konsole history issue
shopt -s histappend
[[ "${PROMPT_COMMAND}" ]] && PROMPT_COMMAND="$PROMPT_COMMAND;history -a" || PROMPT_COMMAND="history -a"

function jpg2pdf { while [ -n "$1" ]; do convert "$1" "$1".pdf; rename 's/\.jpg(\.pdf)$/$1/' "$1".pdf; shift; done; }
# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias insertTP='sudo rmmod psmouse && sudo modprobe -v psmouse'
# vim stuff
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


export EDITOR=vim
export VISUAL=vim
#export PATH=$PATH:/home/gsc/Apps/android-sdk-linux/platform-tools/
#export PATH=$PATH:/home/gsc/Apps/android-ndk-r8b
#export PATH=$PATH:/home/gsc/Apps/android-sdk-linux/tools
#export PATH=$PATH:/opt/android-sdk/platform-tools/
#export PATH=$PATH:/opt/android-sdk/tools
export MAX_JAVA_MEMORY=4096

export PATH=$PATH:/usr/share/eclipse
alias releaseRightMouse='xdotool mouseup 3'
alias wine='env LANG=zh_CN.UTF-8 wine'
alias startipv6='sudo /etc/rc.d/isatapd start'
#alias killwine="ps ax | egrep "*.exe|*exe]" | awk '{ print $1 }' | xargs kill"
alias vi=vim
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias sp='sudo pacman'
alias spsyu='sudo pacman -Syu'
alias spsy='sudo pacman -Sy'
alias sps='sudo pacman -S'
alias spss='pacman -Ss'
alias spr='sudo pacman -Rscn'
alias spc='sudo pacman -Sc'
alias spq='pacman -Qi'
alias spql='pacman -Ql'
alias spqs='sudo pacman -Qs'
alias spf='pacman -Qm'
alias sv='sudo vim'
alias spu='sudo pacman -U'
alias clearRecent='rm /home/gsc/.local/share/recently-used.xbel'
alias vihosts='sudo vim /etc/hosts'
alias wproxy="export http_proxy='127.0.0.1:8086'"
alias pproxy="export http_proxy='166.111.26.3:5678'"
alias gproxy="export http_proxy='127.0.0.1:8087'"
alias g6proxy="export http_proxy='127.0.0.1:8088'"
alias sproxy="export http_proxy='127.0.0.1:8081'"
alias noproxy=""
alias yup="yaourt -Syua"
alias chmirror="sudo vim /etc/pacman.d/mirrorlist"
#alias chconf="sudo vim /etc/rc.conf"
alias chpac="sv /etc/pacman.conf"
alias chhosts="sv /etc/hosts"
alias chresolv="sv /etc/resolv.conf"
alias chgrub="sv /etc/default/grub"
alias xterm='xterm -font -*-droid\ sans-*-*-*-*-*-*-*-*-*-*-*-*'
alias iotop='sudo iotop'
alias top='htop'
alias opacman='pacman-optimize && sync'
alias punzip='python2 /home/gsc/Documents/punzip.py'
alias mkp='makepkg -c -s -i'
alias mks='makepkg -S'
alias ya='yaourt'
alias ssc='sudo systemctl'
alias chawe='vim ~/.config/awesome/rc.lua'

alias svnaddall='svn add --force * --auto-props --parents --depth infinity -q'
fortune | cowsay -n -f $(ls /usr/share/cows/ | shuf -n1)

export CCACHE_DIR=/tmp/
export PATH="/opt/java/bin/:/usr/lib/ccache/bin/:$PATH"
VBOX_USB=usbfs
alias mountMTP="go-mtpfs /home/gsc/MTP"
alias umountMTP="fusermount -u /home/gsc/MTP"
alias E="SUDO_EDITOR=\"emacsclient\" sudo -e"

BLUE=`tput setf 1`
GREEN=`tput setf 2`
CYAN=`tput setf 3`
RED=`tput setf 4`
MAGENTA=`tput setf 5`
YELLOW=`tput setf 6`
WHITE=`tput setf 7`
PS1='\[$GREEN\]\u@\h \[$BLUE\]\w/\[$GREEN\] \$\[$WHITE\] '
HISTFILESIZE=10000
HISTSIZE=5000

