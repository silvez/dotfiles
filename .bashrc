export PS1='\[\033[1;31m\]\u@\h:\[\033[0m\]\w\$ '
export TERM=screen
export HISTFILE=~/.bash_history
export HISTCONTROL="ignoredups"
export DATE=$(date +%y%m%d)
#export HISTIGNORE="&:ls:[bf]g:exit"
#export PS1='\[\033[1;31m\]\u@\h:\[\033[0m\]\w\$ '
#export LESSCHARSET=latin1 # charset do 'less' comp. com portugues?
#export EDITOR=vim
#export LC_ALL=en_US # seta variavel p/ todas 'locale'
#export LANG=pt_BR.ISO-8859-1 # seta idioma.charset do sistema

# editor
if [ -x /usr/bin/vim ]; then
    EDITOR=/usr/bin/vim
    VISUAL=$EDITOR
fi

# If this is an xterm set the title to user@host:dir
#case $TERM in
#xterm*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# setando 'vi mode' no bash
#set -o vi

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# carregando funcoes e aliases (para o screen)
for i in .bash_functions .bash_aliases .bash_misc; do
    source $HOME/${i}
done
