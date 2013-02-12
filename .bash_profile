echo ".bash_profile called..."

# This file is called first (more or less) by all interactive "log-in shells". 
# It is not called by "non-login" shells (like emacs shells) which instead call ~/.bashrc
# Therefore, in order to ensure that all our stuff is set-up in "non-login shells" we are going to chuck it into ~/.bashrc and call that from here

source ~/.bashrc

# Prob want to delete ~/.profile from my master "tools" branch of my home git repository - doesnt seem to be used by default anymore
# source ~/.profile


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
