echo "~/.profile called!"


#===============================================================================================================
# MacPorts Installer addition on 2011-06-24_at_01:49:48: adding an appropriate PATH variable for use with MacPorts.
echo "Configuring your PATH for use with MacPorts..."

export PATH=/opt/local/bin:/opt/local/sbin:$PATH


#Below is modification to put a folder I made with symlinks of versions of commands 
#without version Number suffixes to the main files e.g /opt/local/bin/$symlinkfolder/mysql -> /opt/local/bin/mysql5
# Basically this means i dont have to set aliases as I did in .profile_old - that method interferes with rvm, virtualenv etc...
echo "Adding a path to \"deversioned\" symlinks to some MacPorts commands..."
symlinkfolder=halsRenamed
export PATH=/opt/local/bin/$symlinkfolder:$PATH


# Alternatively this means we link directly to the postgres commands such as 
# createuser, psql etc associated with the current version of postgres that i am using
# echo "Adding a path to postgresql-92 commands..."
# export PATH=/opt/local/lib/postgresql92/bin/psql:$PATH


echo "Finished adapting your PATH environment variable for use with MacPorts."

# Add GO compiler to your PATH variable
# Meh - leave out for now - maybe install via Macports later
echo "Adding Go compiler to your path..."
#export PATH=$PATH:/Developer/go/bin

#===============================================================================================================
# Alias commands to start and stop the macPorts installed version of mySQL
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'

# For now i think i will call this explicitly in the shell and not automatically
# - but we need to do this to have access to virtualenvwrapper commands
#source virtualenvwrapper.sh

#===============================================================================================================
# Python related
echo "Modifying some Pyhton related environment variables: PYTHONPATH & PYTHONSTARTUP..."
export PYTHONPATH=$PYTHONPATH:/Users/Noches/Code/Python/MyModules
export PYTHONSTARTUP=/Users/Noches/Code/Python/MyModules/PythonStartUp.py
# Python VirtualEnvwrapper
# # source /opt/local/bin/halsRenamed/virtualenvwrapper.sh
# # The following is related to making the Python tools virtualenv & virtualenvwrapper work
# # export WORKON_HOME=$HOME/.virtualenvs

#===============================================================================================================
#Attempting to get the old command line automatic history searching back....
# bind '<Up>:history-search-backward'
# bind '<Down>:history-search-forward'
#bind '"M-[A":history-search-backward'
#bind '"M-[B":history-search-forward'
#"\e[A": history-search-backward
#"\e[B": history-search-forward
#*********************************************************************************
#This is how you do it! Needed macports bash_completion module
# AND appparently needs bash > 4.1 and/or macports bash to be the default shell
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#===============================================================================================================
# This sets how many commands are stored in the bash history file and how many are stored from the current session
# Default values were previously 500 for both...
export HISTFILESIZE=2000
export HISTSIZE=2000
# Changes commands to be appended to bash history file rather than overwritten
# Not sure about the below 2 lines
# # # unset HISTFILESIZE
# # # export PROMPT_COMMAND="history -a"
#shopt -s histappend


#===============================================================================================================
#Setup Git editor - not sure about this....
export GIT_EDITOR='emacs'



#===============================================================================================================
# Some crazy shit from the internets...

red="\[\e[0;33m\]"
yellow="\[\e[0;31m\]"

if [ `id -u` -eq "0" ]; then
        root="${yellow}"
    else
            root="${red}"
        fi

        PS1="\[\e[0;37m\]┌─[${root}\u\[\e[0;37m\]][\[\e[0;96m\]\h\[\e[0;37m\]][\[\e[0;32m\]\w\[\e[0;37m\]]\n\[\e[0;37m\]└──╼ \[\e[0m\]"
        PS2="╾──╼ "
