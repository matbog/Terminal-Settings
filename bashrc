# .bashrc file 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# by M BOGDAN 
# https://github.com/matbog/Terminal_settings 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Source global definitions ~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## Export Display for WSL2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1

## Git branch display ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]▶/'
}

## Colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prompt colors
PS1='\[\e[1;32m\]\u\[\e[0;33m\]@\[\e[0;36m\]\H\[\e[0;33m\]:\[\e[0;33m\]\w\[\033[01;31m\]$(parse_git_branch)\[\e[0;33m\]$\[\e[0;0m\]'
# 'LS' Colors
LS_COLORS='rs=0:di=01;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

## Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -hX --color=auto'
    alias ll='ls -lhX --color=auto'
    alias lc='ls -ltcr --color=auto'
    alias la='ls -ltahX --color=auto'
    alias l='ls -rtl --color=auto'
fi

alias rms='rm -vf *~'
alias utop='top -u bogdan'
alias uhtop='htop -u bogdanOF'
alias vi='vi -O'
alias t="tree ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias c="clear"
# Conda 
alias cdd='conda deactivate'
alias cda='conda activate base'
# CSSH (cluster-ssh)
alias cssh='mv .csshrc.DISABLED .csshrc | cssh cluster_arep'
# OpenFOAM-1806
alias of1806='source /opt/OpenFOAM/OpenFOAM-v1806/etc/bashrc'

## Usefull Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Extract most common archive filetypes
extract ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1	;;
			*.tar.gz)	tar xvzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		unrar x $1	;;
			*.gz)		gunzip  $1	;;
			*.tar)		tar xvf $1	;;
			*.tbz2)		tar xvjf $1	;;
			*.tgz)		tar xvzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z xvjf $1	;;
			*) 			echo "din't know how to extract '$1'... "
    	esac
	else
		echo "'$1' is not a valid file!"
	fi
}
# Shows the number of files in a directory
numf()
{ 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}
#netinfo - shows network information for your system
netinfo ()
{
    echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	/sbin/ifconfig | awk /'inet addr/ {print $4}'
	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
	echo "${myip}"
	echo "---------------------------------------------------"
}
