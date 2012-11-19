# ~/.bash_profile: executed by bash(1) for login shells.
#
# Catalyst Systems Administrator version - note that you
# shouldn't customise this, since it will get overwritten
# with a new version from your package.  If you want local
# actions on this machine put them into ~/.bash_profile_local
# which is sourced at the end, if it is present.
#

DEBVERSION="`cat /etc/debian_version`"
UTFVERSION="3.1"
versions() {
  cat /etc/debian_version
  echo ${UTFVERSION}
}

if [ "`versions | sort | head -n 1`" = "${UTFVERSION}" ] ; then
  if locale -a | grep -q -i '^en_NZ\.UTF-*8$' ; then
    LC_COLLATE=POSIX
    export LC_COLLATE

    LC_CTYPE=POSIX
    export LC_CTYPE

    LANG=en_NZ.UTF-8
    export LANG
  else
    echo "Warning: locale 'en_NZ.UTF-8' is not available on this host" >&2
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# include .bash_profile_local if it exists
if [ -f ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

