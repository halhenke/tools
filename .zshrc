echo ".zshrc called..."

# Some good info on setting up
# https://wiki.archlinux.org/index.php/Zsh

# Now we have tried to separate this file into OS X/Linux specific bashrcs: 
current_os=$(uname)
# current_os=OSTYPE # More complex
if [[ $current_os  == 'Linux' ]]; then
    source ~/.zshrc_linux
elif [[ $current_os == 'Darwin' ]]; then
    source ~/.zshrc_mac
else
    echo "Some other OS - Not sure what further zshell config settings to run"
fi

# --------------------------------------------
# RVM
# --------------------------------------------
# echo "doing RVM stuff - modifying your PATH..."
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Dont think we need this below bit with zshell - path is an array  
# and much easier to manipulate
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
# Hopefully make z-shell work better in emacs shells
# See http://zsh.sourceforge.net/FAQ/zshfaq03.html
[[ $EMACS = t ]] && unsetopt zle

# if [ -n "$INSIDE_EMACS" ]; then
#   chpwd() { print -P "\033AnSiTc %d" }
#   print -P "\033AnSiTu %n"
#   print -P "\033AnSiTc %d"
# fi
# --------------------------------------------
