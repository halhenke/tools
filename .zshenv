echo ".zshenv called..."

# This file is called first (more or less) by all interactive "log-in shells". 
# It is not called by "non-login" shells (like emacs shells) which instead call ~/.bashrc
# Therefore, in order to ensure that all our stuff is set-up in "non-login shells" we are going to chuck it into ~/.bashrc and call that from here

# Want to be able to reset PATH variable later without restarting shell
export HAL_ORIG_PATH=$PATH
