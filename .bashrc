echo ".bashrc called..."

# Now we have tried to separate this file into OS X/Linux specific bashrcs: 
current_os=$(uname)
# current_os=OSTYPE # More complex
if [[ $current_os  == 'Linux' ]]; then
    source ~/.bashrc_linux
elif [[ $current_os == 'Darwin'  ]]; then
    source ~/.bashrc_mac
else
    echo "Some other OS..."
fi

# --------------------------------------------------------------------
# PERSONAL EXECUTABLE/SCRIPT PATH
# --------------------------------------------------------------------
PATH=$HOME/bin:$PATH
# --------------------------------------------------------------------

# --------------------------------------------
# RVM
# --------------------------------------------
# echo "doing RVM stuff - modifying your PATH..."
# # PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# export HAL_RVM_PATH=$HOME/.rvm/bin 
# PATH=$PATH:$HAL_RVM_PATH
