# ~/.bash_logout: executed by bash(1) when login shell exits.

# Set title bar to something sensible.
case $TERM in
        *xterm*)
                echo -e "\033]0;xterm\007"
        ;;
esac

# when leaving the console clear the screen to increase privacy

case "`tty`" in
    /dev/tty[0-9]) clear
esac

