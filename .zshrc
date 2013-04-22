echo ".zshrc called..."

# Some good info on setting up
# https://wiki.archlinux.org/index.php/Zsh

# Now we have tried to separate this file into OS X/Linux specific bashrcs: 
current_os=$(uname)
# current_os=OSTYPE # More complex
if [[ $current_os  == 'Linux' ]]; then
    source ~/.zshrc_linux
elif [[ $current_os == 'Darwin'  ]]; then
    source ~/.zshrc_mac
else
    echo "Some other OS..."
fi

# --------------------------------------------
# RVM
# --------------------------------------------
# echo "doing RVM stuff - modifying your PATH..."
# # PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# export HAL_RVM_PATH=$HOME/.rvm/bin 
# PATH=$PATH:$HAL_RVM_PATH


# --------------------------------------------
# STUFF THAT WE WANT IN ALL ENVIRONMENTS
# --------------------------------------------
# Mass file renaming
# --------------------------------------------
autoload -U zmv
alias mmv='noglob zmv -W'
# --------------------------------------------
