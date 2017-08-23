# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


C_RED="\[\e[1;31m\]"
C_BLUE="\[\e[1;34m\]"
C_GRAY="\[\e[1;30m\]"
C_WHITE="\[\e[1;37m\]"
C_YELLOW="\[\e[1;33m\]"
#C_DEF='\e[0m'
C_DEF="\[\033[0m\]"

mUID=`id -u`
MACHINE="portable"



# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
        xterm*)
                if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
                        PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
                else
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
                fi
                ;;
        screen)
                if [ -e /etc/sysconfig/bash-prompt-screen ]; then
                        PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
                else
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
                fi
                ;;
        *)
                [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
            ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize

        if [ "$mUID" = "0" ] ; then
        #PS1="${C_RED}\u${C_DEF}@${C_BLUE}\h${C_DEF} \w> "
        PS1='[\t]\[\033[31m\]\u\[\033[36m\]@\[\033[33m\]\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$ '
                PS2="${C_RED}>${C_DEF}  "
        else
        #PS1="\u@${C_BLUE}\h${C_DEF} \w> "
        PS1='[\t]\[\033[31m\]\u\[\033[36m\]@\[\033[33m\]\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$ '
                PS2="${C_BLUE}>${C_DEF}  "
        fi
   #[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="\[\u@\033[34;1;1mportable\033[0m\] \w > "
fi

if ! shopt -q login_shell ; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
            if [ -r "$i" ]; then
                . $i
            fi
        done
        unset i
fi
# vim:ts=4:sw=4

echo `uptime`
echo "Kernel:" `uname -r` "("`uname -v`")"
echo ""

# Alias
alias bip='putty -load Nom &'
alias path='echo $PATH'
alias ba='vi ~/.bashrc;source ~/.bashrc'
alias ccze='ccze -A'
alias cgrep='grep --color=always'
alias ls='ls --color=always'
alias dir='dir --color=always'
alias ll='ls -alh'
alias log='tail -f /var/log/mail.log|ccze -A'
alias lsd='ls -d */'
alias lll='ls -la | less'
alias cd..='cd ..'
alias md='mkdir'
alias tt='telnet'
alias up='sudo apt-get update && sudo apt-get upgrade'
alias se='sudo apt-cache search'
alias ins='sudo apt-get install'
alias ee='exit'
alias q='exit'
alias in='sudo vi /etc/network/interfaces'
alias re='sudo /etc/init.d/networking restart'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias du='du -kh'
alias dud='du --max-depth=0'
alias df='df -kTh'
alias stat="echo ' ' && uname -a && echo ' '&& uptime &&echo ' '&& df && echo ' '"
alias build='./configure && make && sudo make install'
alias grepc='grep -v \^#'
alias g='grep'
alias G='grep -i'
alias im='import /home/user/Desktop/toto.png'
alias so='sudo vi /etc/apt/sources.list'
alias cp='cp -i'
alias mv='mv -i'
alias svi="sudo vi"
alias sless="sudo less"
alias stail="sudo tail"
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias lm='ls -al |most'
alias xs='cd'
alias vf='cd'
alias mm='ll'
alias hgrep='history | grep --color=always'
alias which='type -all'
alias eterm='Eterm -Ox --scrollbar no --buttonbar no --font-fx none -f white Eterm -g 120x30+100+100 --shade 50'
alias cd-='cd -'
alias removeemptylines="sed -i -e '/^$/d'"
alias s='sudo'
alias ccal='var=$(cal -m); echo "${var/$(date +%-d)/$(echo -e "\033[1;31m$(date +%-d)\033[0m")}"'
alias t='tail'
alias tf='tail -f'
alias +x='chmod +x'
alias epoch='date +%s'
alias mark='echo =============================='

export TERM=xterm

# activation date_heure dans la commande history
export HISTTIMEFORMAT="%Y/%m/%d_%T : "
