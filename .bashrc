# .bashrc
#
# UPDATED Fri Oct  2 15:13:11 BRT 2009

#
# VARIAVEIS
#
export PS1='\[\033[1;31m\]\u@\h:\[\033[0m\]\w\$ '
#export TERM=linux
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
#export http_proxy=http://192.168.0.2:4040 # variavel usada de proxy
#export ftp_proxy=http://192.168.0.2:4040 # variavel usada de proxy
#export http_proxy=http://usuario:senha@seu.proxy:porta-de-seu-proxy # com auth
#export ftp_proxy=http://usuario:senha@seu.proxy:porta-de-seu-proxy # com auth

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

#
# OPCOES
#
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
source ~/.bash_functions
source ~/.bash_aliases
source ~/.bash_misc

#
# ALIASES
#
##############################
# CYGWIN
##############################
#alias shut='shutdown -s -f now'
#alias cmd='start cmd'
#alias ofc='start /c/Arquivos\ de\ programas/BrOffice\.org\ 3/program/soffice.exe'
#alias open='netstat -nap tcp| grep -i listen'
#alias proxy='ssh 10.10.10.88 -p 55555 -l root'
#alias start='cygstart'
#alias calc='start calc'
#alias tm-stop='net stop "Trend Micro Client/Server Security Agent RealTime Scan"'
#alias tm-start='net start "Trend Micro Client/Server Security Agent RealTime Scan"'
#alias cwox='cygstart.exe /c/Arquivos\ de\ programas/netw/netw536/netwox536.exe'
#alias sshvm='sshtmp 10.10.10.101 -l root'
##############################
#alias rdesktop-cpf='rdesktop -u Administrador -k pt-br -g 80% -x m -a 8 -z -P -r disk:slackr=/home/bruno 189.19.252.23:3390'
#alias rdesktop-win='rdesktop -u bruno -p bruno123 -k pt-br -g 90% -z -P -r disk:slackr=/home/bruno 192.168.1.3'
#alias rdesktop-samara='rdesktop -u Administrador -p lbhdonil -k en-us -g 90% -z -P -r  disk:slackr=/home/bruno 192.168.1.100'
#alias cls='clear'
#alias grep='grep --color' # show differences in colour
#alias grepi='grep -i --color' # show differences in colour
#alias g='grep'
#alias o='less'
#alias ls='ls -Atr --color=auto'
#alias l='ls -lh'
#alias p='ps x'
#alias cd..='cd ..'
#alias cd-='cd -'
#alias ..='cd ../'
#alias ...='cd ../../'
#alias md='mkdir -p'
#alias mkdir='mkdir -p'
#alias rd='rm -R'
#alias cp='cp -v'
#alias mv='mv -v'
#alias m='mount'
#alias um='umount'
#alias du='du -hc'
#alias df='df -h'
#alias fl='file'
#alias s='ssh'
#alias S='screen -ex'
#alias x='startx'
#alias v='vim'
#alias free='free -m'
#alias my_ip='wget -O - checkip.dyndns.org 2>/dev/null|cut -d ":" -f2|cut -d "<" -f1'
#alias hex='hexedit'
#alias mpg='mpg123'
#alias mpgd='\ls|sort|mpg123 -v -@ -'
#alias dpl='display'
#alias shut='shutdown -h now'
#alias el='elvis'
#alias gns3='/usr/local/GNS3-0.6.1/./gns3'
#alias freechess='xboard -ics -icshost 69.36.243.188'
#alias ofc='openoffice.org3'
#alias pdf2txt='pdftotext -enc Latin1 -layout'
#alias pdf='xpdf'
#alias pyh='splitvt -rcfile ~/.splitvtrc-pyhelp'

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZOFF=""  # desligue funcoes indesejadas
export ZZPATH="/usr/bin/funcoeszz"  # script
source "$ZZPATH"				
