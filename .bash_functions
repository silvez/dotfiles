# .bash_functions
#
# http://dotfiles.repository.steve.org.uk/
#
# Modified by Bruno S. Vezzaro
#
# UPDATED 2010-01-21 at 16:02

#  Extract named archive(s).
ext ()
{
    for archive in "$@"; do
        case "$archive" in
            *.tar* | *.t?z)
                case $archive in
                    *.gz | *tgz | *.Z)
                        TARFLAGS="--use-compress-prog gzip"
                    ;;
                    *.bz | *.bz2 | *tbz)
                        TARFLAGS="--use-compress-prog bzip2"
                    ;;
                    *)
                        TARFLAGS=""
                    ;;
                esac;
                tar xvf "$archive" ${TARFLAGS}
            ;;
            *.zip | *.ZIP)
                unzip "$archive"
            ;;
            *.gz | *.GZ)
                gunzip -v "$archive"
            ;;
            *.deb)
                dpkg-deb -x "$archive" .
            ;;
            *.rar)
                unrar x "$archive"
            ;;
            *.cpio)
                cpio --extract --make-directories --file="$archive"
            ;;
            *.cpio.gz)
                gzip -dc "$archive" | cpio --extract --make-directories
            ;;
            *)
                echo "Unknown archive format" 1>&2
            ;;
        esac;
    done
}

#  Connect to ssh without recording host-key
sshtmp ()
{
    ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" "$@"
}

#  Do an SCP without recording, or prompting for host keys.
scptmp ()
{
    scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" "$@"
}

sshrmv ()
{
    sed -i "/$1/d" ~/.ssh/known_hosts 2> /dev/null
}

#  Recursive "deborphan"
#if [ -x /usr/bin/deborphan ]; then
#    function deborphan-recursive ()
#    {
#        while [ -n "`deborphan`" ]; do
#            dpkg --purge `deborphan`
#        done
#    }
#fi

#  Create a screen with the name of the current host, or attach to
# it here and now if it already exists.
#
#screeny ()
#{
#    screen -D -R -S `hostname`
#}


#  These depend upon curl.
if [ -x /usr/bin/curl ]; then
    # http_headers: get just the HTTP headers from a web page (and its redirects)
    http_headers () { /usr/bin/curl -I -L $@ ; }

    # debug_http: download a web page and show info on the time spent
    debug_http () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect } pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
fi

#  Find setuid/setgid binaries
findsetuid()
{
    if [ -z "$1" ]; then
        dir=.
    else
        dir=$1
    fi

    find $dir -perm +6000 -type f  -exec ls -ld {} \;
}

findsetgid()
{
    if [ -z "$1" ]; then
        dir=.
    else
        dir=$1
    fi

    find $dir -perm +2000 -type f  -exec ls -ld {} \;
}

# LS for dirs
lsd ()
{
    ls -1F $* | grep '/$'
}

#paranoia()
#{
#    touch ~/.paranoid &&  bash --login && rm ~/.paranoid
#}

## check if a host is alive
#alive ()
#{
#    ping -q $@ -c 3 2>/dev/null|grep -v '^$'
#}
#
## make some infos check in host
#if [ -x /bin/whois ]; then
#    infohost () { for i in http_headers alv whois; do $i $@; done ;}
#fi

# Seek any text-based mp3 player, and play mp3 files in current dir
# TODO implemente choose dirs to play files
#mpgd ()
#{
#    for player in mpg123 mpg321; do
#        if [[ -e $(which $player 2> /dev/null) ]]; then
#            file "$(pwd)"/* | sed -n '/layer III/s/\(^.*mp3\{1\}\).*/\1/p' > play.lst
#            $player -C -v -@ play.lst
#            break
#        fi
#    done
#    rm play.lst
#}

# Rename char-to-char. Default rename " " to _
# TODO: need fix on find with IFS
renchar ()
{
    if [ $# == 0 ]; then
        # this way dont work correctly with links
        for file in *; do
        #for file in `find . ! -type l -maxdepth 1`; do
            mv -v "$file" "${file//\ /_}" 2>/dev/null
        done
    elif [ $# == 2 ]; then
        # this way dont work correctly with links
        for file in *; do
        # for file in `find . ! -type l -maxdepth 1`; do
            mv -v "$file" "${file//$1/$2}" 2>/dev/null
        done
    else
        echo "Use: $0 [blank for \" \" to _ ] or [from to] to rename chars"
        exit 1
    fi
}

blank ()
{
    sed -i 's/^[ \t]\+\|[ \t]\+$//g' $1
    sed -i '/^$/d' $1
}

myip ()
{
    wget -O - checkip.dyndns.org 2>/dev/null|cut -d ":" -f2|cut -d "<" -f1
}

# load funcoeszz
#for i in /bin/funcoeszz /usr/bin/funcoeszz; do
#    if [ -e $i ]; then
#        source $i
#    fi
#done

s ()
{
    #if which sshpass 2> /dev/null; then
    #    sshpass -f /etc/known.bug ssh -l bvezzaro $@
    #fi
    sshpass -f /etc/known.bug ssh -q -o "StrictHostKeyChecking no" -l bvezzaro $@
}

ss ()
{
    #test $# == 1 && ssh bvezzaro@$@
    ssh -q -o "StrictHostKeyChecking no" bvezzaro@$@
}
