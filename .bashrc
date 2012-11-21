# ~/.bashrc: executed by bash(1) for non-login shells.
#
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# Catalyst Systems Administrator version - note that you
# shouldn't customise this, since it will get overwritten
# with a new version from your package.  If you want local
# actions on this machine put them into ~/.bashrc_local
# which is sourced at the end, if it is present.
#


# If running interactively, then:
if [ "$PS1" ]; then

    # don't put duplicate lines in the history. See bash(1) for more options
    export HISTCONTROL=ignoredups

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    #shopt -s checkwinsize

    # enable color support of ls and also add handy aliases
    if [ "$TERM" != "dumb" ]; then
        eval `dircolors -b`
        alias ls='ls --color=auto'
        #alias dir='ls --color=auto --format=vertical'
        #alias vdir='ls --color=auto --format=long'
    fi

    # some more ls aliases
    #alias ll='ls -l'
    #alias la='ls -A'
    #alias l='ls -CF'

    # set a fancy prompt
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;
    *)
        ;;
    esac

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc).
    #if [ -f /etc/bash_completion ]; then
    #  . /etc/bash_completion
    #fi

    # Set a colourful prompt on production machines
    if [ -e /etc/catalyst-machineinfo ]; then
      . /etc/catalyst-machineinfo
      if [ "$ROLE" == "production" ]; then
        PS1="\[\e[31;1m\]$PS1\[\e[0m\]"
      fi
    fi

fi

# include .bashrc_local if it exists
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

