# For some reason - a .xinittrc file currently breaks X11 on OS X
if [[ $(uname) == 'Linux' ]]; then
    if [[ -e ~/.Xresources ]] then
	xrdb -merge ~/.Xresources
    fi
fi
