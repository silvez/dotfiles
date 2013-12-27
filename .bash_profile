#
# If not running interactively, don't do anything
#
#[ -z "$PS1" ] && return

#
# Set a sane umask
#
umask 022

#
# include our files.
#
for i in .bashrc .bash_aliases .bash_functions .bash_misc ; do
    if [ -e ~/$i ]; then
        source ~/$i
    fi
done

#
#  Set the PATH to include ~/bin, ~/bmbin, and ~/bin-$hostname if
# they exist.
#
#for i in ~/bin ~/bmbin ~/bin-$(hostname --short) ; do
#    if [ -d $i ]; then
#        PATH=$i:${PATH}
#    fi
#done
#export PATH=$PATH:/usr/sbin:/sbin:/usr/games

#
#  If we have lessfile installed then use it for less.
#
#if [ -x /usr/bin/lessfile ]; then
#   eval $(/usr/bin/lessfile)
#fi

##
#
#  Now we have some settings.
#
##

# if a binary goes away then drop it.
shopt -s checkhash

# check window size.
shopt -s checkwinsize

# disable mail notifications.
shopt -u mailwarn

# history
shopt -s histappend histreedit
shopt -s histverify cmdhist

# remove directory
[ -d ~/.bash_history ] && rm -rf ~/.bash_history

#
# Enable programmable completion features if they're not already
# enabled, and if they are available.
#
#if [ -z "$BASH_COMPLETION" ] && [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi
#
#
#  Disable beeps in X.org
#
#if [ ! -z "${DISPLAY}" ]; then
#    xset b off
#fi
#
#
#  Now for the console too - unless we're connecting via SSH
#
#if [ -z "$SSH_CLIENT" ]; then
#    if [ ! -z "$TERM" ]; then
#        setterm -blength 0
#    fi
#fi
