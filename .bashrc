echo ".bashrc called..."

# ----------------------------------------------------------------------
# THE SHELL
# ----------------------------------------------------------------------
# echo "Setting your shell - Bash via MacPorts"
# /opt/local/bin/bash
echo "Your shell is $SHELL and you are running version $BASH_VERSION"

# ----------------------------------------------------------------------
# SETTING UP THE PROMPT
# ----------------------------------------------------------------------
echo "Setting up your prompt: colour"
# Colour format:
# \e[   # colour begin
# 0;xxm # light text colour
# 1;xxm # dark text colour
# xxm   # background colour
# \e[m  # colour end
STARTCOLOR='\e[';
ENDCOLOR="\e[m";
BLUE="1;34m";
RED="0;31m";

# export PS1="\u@\h \w: "
# export PS1="\e[1;34m\u\e[m@\h \e[0;31m\w\e[m> "
export PS1="$STARTCOLOR$BLUE\u$ENDCOLOR@\h $STARTCOLOR$RED\w$ENDCOLOR> "

# export PS1="\[$(tput bold)$(tput setb 4)$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"
LOOKGOOD="\[$(tput bold)$(tput setb 4)\]"
LOOKNORM="\[$(tput sgr0)\]"
LOOKWHITE="\[$(tput setaf 7)\]"
LOOKBLUE="\[$(tput setaf 4)\]"
LOOKRED="\[$(tput setaf 1)\]"
# export PS1="\[$(tput bold)$(tput setb 4)$(tput setaf 4)\]\u@\[$(tput setaf 7)\]\h:\[$(tput setaf 1)\] \w\[$(tput sgr0)\]: "
export PS1="$LOOKGOOD$LOOKBLUE\u$LOOKNORM@$LOOKGOOD$LOOKWHITE\h:$LOOKRED \w$LOOKNORM: "

# ----------------------------------------------------------------------
# RUBY
# ----------------------------------------------------------------------
#rvm stuff
# Yeah this stuff kinda sucks
echo "Ruby RVM bypassed..."
# echo "doing Ruby RVM stuff - modifying your PATH..."
# [[ -s "/Users/Hal/.rvm/scripts/rvm" ]] && source "/Users/Hal/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# rvm default 1.9.3
# rvm gemset use rails3



# ----------------------------------------------------------------------
# PYTHON
# ----------------------------------------------------------------------
#python stuff - python packages are now to be installed to ~/.local
#with the command 
#python setup.py install --prefix=~/.local
#------------------------------------------------------------
echo "doing Python stuff - modifying your PATH..."
if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi

# Python path -----------------------------------------------------
if [ -d ~/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi
#python stuff related to virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true

#HAL - Think we need this to have virtualenvwrapper commands available from the shell...
source /Users/Hal/.local/bin/virtualenvwrapper.sh

# ----------------------------------------------------------------------
# HAL STUFF
# ----------------------------------------------------------------------
#HAL - This allows us to see hidden files in Finder if we then "hold ‘alt’ on the keyboard and right click on the Finder icon in the dock and Click on Relaunch"
echo "hidden paths will be shown in Finder..."
defaults write com.apple.Finder AppleShowAllFiles YES

#Starting PostgreSQL:
# postgres -D /usr/homebrew/var/postgres
# or
# pg_ctl -D /usr/homebrew/var/postgres -l logfile start
##
# Your previous /Users/Hal/.bash_profile file was backed up as /Users/Hal/.bash_profile.macports-saved_2012-11-17_at_22:42:07
##

# ----------------------------------------------------------------------
# HOMEBREW
# ----------------------------------------------------------------------
# Dont want this if possible
# echo "doing Homebrew stuff - modifying your PATH..."
# echo "You sure about this?"
# export PATH=/usr/homebrew/bin:$PATH

# ----------------------------------------------------------------------
# MACPORTS
# ----------------------------------------------------------------------
# MacPorts Installer addition on 2012-11-17_at_22:42:07: adding an appropriate PATH variable for use with MacPorts.
echo "doing Macports stuff - modifying your PATH..."
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Enable the bash-completion port
echo "enabling bash_completion..."
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
# This is currently duplicated in .inputrc - fix
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


# POSTGRES
echo "hackish way to get Postgres commands available with MacPorts - modifying your PATH..."
export PATH=/opt/local/lib/postgresql92/bin/:$PATH

# VERSIONLESS LINKS TO BINARIES IN MACPORTS
echo "hackish way to access some MacPorts binaries with versions as suffixed onto their names - modifying your PATH..."
export PATH=~/.hals_macport_links:$PATH

# mucking with escape sequences
# 0x1b 0x5b 0x35 0x1b 0x5b 0x44

### Added by the Heroku Toolbelt
echo "Yuck - heroku is appending itself to the front of your PATH :-|"
export PATH="/usr/local/heroku/bin:$PATH"
