echo ".zshenv called..."

# This file is called first (more or less) by all interactive "log-in shells". 
# It is not called by "non-login" shells (like emacs shells) which instead call ~/.bashrc
# Therefore, in order to ensure that all our stuff is set-up in "non-login shells" we are going to chuck it into ~/.bashrc and call that from here

# Want to be able to reset PATH variable later without restarting shell
export HAL_ORIG_PATH=$PATH

# ----------------------------------------------------------------------
# ADD SSH KEYS TO THE SSH-AGENT
# Want to add stuff, particularly my fave ssh key, to the ssh-agent
# ----------------------------------------------------------------------
# TODO
#  - check if ssh-agent is running
#  - check if hal_rsa has already been added to the ssh-agent
if [[ -a ~/.ssh/hal_rsa ]]; then
    ssh-add ~/.ssh/hal_rsa
fi
