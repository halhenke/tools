echo ".bash_profile called..."

# This file is called first (more or less) by all interactive "log-in shells". 
# It is not called by "non-login" shells (like emacs shells) which instead call ~/.bashrc
# Therefore, in order to ensure that all our stuff is set-up in "non-login shells" we are going to chuck it into ~/.bashrc and call that from here

# Want to be able to reset PATH variable later without restarting shell
export HAL_ORIG_PATH=PATH

# ----------------------------------------------------------------------
# ADD SSH KEYS TO THE SSH-AGENT
# Want to add stuff, particularly my fave ssh key, to the ssh-agent
# ----------------------------------------------------------------------
if [[ -a ~/.ssh/hal_rsa ]]; then
    ssh-add ~/.ssh/hal_rsa
fi
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# CALL BASHRC
# ----------------------------------------------------------------------
source ~/.bashrc
# ----------------------------------------------------------------------

# Prob want to delete ~/.profile from my master "tools" branch of my home git repository - doesnt seem to be used by default anymore
# source ~/.profile

# echo "doing RVM stuff - loading rvm script..."
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
