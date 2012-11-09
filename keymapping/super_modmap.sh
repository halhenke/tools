#!/bin/bash
xmodmap -e 'keycode 133 = F13'
# This gives a "xmodmap -pke | grep 133" output of:
# keycode 133 = F13 NoSymbol F13

# Original output of "xmodmap -pke | grep 133" is:
# keycode 133 = Super_L NoSymbol Super_L
# i.e. to reset to default:
# xmodmap -e 'keycode 133 = Super_L'
