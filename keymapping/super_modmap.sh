#!/bin/bash
# xmodmap -e 'keycode 133 = F13'
# xmodmap -e 'add mod4 = F13'
# add mod3 =      
# add mod4 =        Super_L  Super_R  Super_L  Hyper_L 

# This gives a "xmodmap -pke | grep 133" output of:
# keycode 133 = F13 NoSymbol F13

# Original output of "xmodmap -pke | grep 133" is:
# keycode 133 = Super_L NoSymbol Super_L
# i.e. to reset to default:
# xmodmap -e 'keycode 133 = Super_L'


# https://bugs.launchpad.net/ubuntu/+source/x11-xserver-utils/+bug/576102
# https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/524774
