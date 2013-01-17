# ~/.bash_logout: executed by bash(1) when login shell exits.

# HAL - below is from Catalsyt/Linux - not sure if any of it is helpful

# # Set title bar to something sensible.
# case $TERM in
#     *xterm*)
#         echo -e "\033]0;xterm\007"
#         ;;
# esac

# # when leaving the console clear the screen to increase privacy

# case "`tty`" in
#     /dev/tty[0-9]) clear
# esac

# # HAL - kill ssh-agent (helps to persist ssh-add)
# kill $SSH_AGENT_PID
