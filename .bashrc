# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TMOUT=0

# git alias autocompletes
__git_complete gchk _git_checkout
__git_complete gmrg _git_merge
__git_complete gmrgs _git_merge
__git_complete gpll _git_pull

# User specific aliases and functions
umask 007

#-------------------------------------------------------------
# ls aliases
#-------------------------------------------------------------
alias ls='ls -lasFH --color=always | column -t'
alias lsx='ls -lXB' # Sort by extension
alias lsk='ls -lSr' # Sort by size, biggest last
alias lst='ls -ltr' # Sort by date, most recent last
alias lsc='ls -ltcr' # Sort by/show change time,most recent last
alias lsu='ls -ltur' # Sort by/show access time,most recent last
alias lsl="ls -lv --group-directories-first"
alias lsm='ls | more' # Pipe through 'more'
alias lsa='ll -a'  # Show hidden files

#-------------------------------------------------------------
# misc aliases
#-------------------------------------------------------------
alias oops='sudo !!'
alias listen='netstat -l | grep "LISTEN "'
alias tarz='tar -zxvf '
alias functions='set | grep "()"'
alias ipf='ipconfig //flushdns'
alias c='clear'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias ports='netstat -tulanp'

alias nginxr='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxt='sudo /usr/local/nginx/sbin/nginx -t'

alias cpuinfo='lscpu'

alias psgp='ps -efaux | grep'


#-------------------------------------------------------------
# override aliases
#-------------------------------------------------------------
alias history="history | more"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv' #make parent dirs if needed
alias mount='mount | column -t'
alias ps='ps u | column -t'


#-------------------------------------------------------------
# iptables aliases
#-------------------------------------------------------------
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

#-------------------------------------------------------------
# cd aliases
#-------------------------------------------------------------
up() { 
	cd ../"$1";
}
upp() { 
	cd ../../"$1";
}
uppp() { 
	cd ../../../"$1";
}


#-------------------------------------------------------------
# Angular aliases
#-------------------------------------------------------------
alias ngse="ng serve"
alias ngbp="ng build --target=production"


#-------------------------------------------------------------
# Spelling typos
#-------------------------------------------------------------
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias sl='ls'
alias le='ls'
alias gerp=grep


#-------------------------------------------------------------
# apt-get aliases
#-------------------------------------------------------------
alias app="sudo apt-get"
alias app-remove="sudo apt-get remove"
alias app-install="sudo apt-get install"
alias app-edit="sudo envedit /etc/apt/sources.list"
alias app-search="apt-cache --names-only search"
alias app-search-all="apt-cache search"
alias app-update="sudo apt-get update && sudo apt-get upgrade"
alias app-info="apt-cache showpkg"


#-------------------------------------------------------------
# Git aliases and functions
#-------------------------------------------------------------
alias gadd='git add'
alias gcom='git commit -am'
alias gpsh='git push'
alias gpshu='git push -u'
alias gpll='git pull'

alias gmrg='git merge --no-commit'
alias gmrgs='git merge --squash --no-commit'

alias glgf='git log --name-status --pretty=format:"%C(yellow) %H %C(red) %cD %C(green) %<(25)%cN %C(white) %s"'
alias glgs='git log --pretty=format:"%C(yellow) %h %C(red) %<(31,trunc)%cD %C(green) %<(25)%cN %C(white) %<(75,trunc)%s"'

alias gnew='git checkout -b'
alias gchk='git checkout'
alias gbrn='git branch'
alias gall='git branch -r'
alias gallg='git branch - r | grep'

alias gint='git init'

alias gsth='git stash'
alias gpop='git stash pop'
alias gdrp='git stash drop'

alias gstt='git status'
alias gdif='git diff'

alias grss='git reset --soft'
alias grsm='git reset --mixed'

alias ggui='git gui'

alias gcph='gcom "automated commit";gpsh'
alias gcphu='gcph -u'

grsh() {
	git reset --hard HEAD~"$1";
}

gblm() { 
	git blame -L"$1","$2" "$3"; 
}

# save work, checkout master branch, merge into my branch, then commit/push
gmrgm() {
	gcom 'saving work';gchk "$1";gpll;gchk "$2";gmrg "$1";gcom 'merge';gpsh;
}

glgp() {
	git log -p -"$1"
}

gshw() {
	git show "$1"
}



#  create new alias from cmd line
# ALIASES=~/.aliases
# function add_alias {
#	 echo "alias $1='$2'" >> $ALIASES;
#	 echo Adding alias: `tail -1 $ALIASES`;
#	 source $ALIASES;
# }

mkcd () # mkdir and cd into it
{ 
	mkdir -p "$1";
	cd "$1"
}

#  create new repo on github
 gitRepo () {
	 curl -u 'myuser' https://api.github.com/user/repos -d "{\"name\":\"\"$1\"\"}";
	 git remote add origin git@github.com:myuser/"$1".git;
	 git push -u origin master;
}


google () {
	u=`perl -MURI::Escape -wle 'print "http://google.com/search?q=".
		uri_escape(join " ",  @ARGV)' $@`
	/usr/bin/w3m -F $u
}

sublime() {
	"C:/Program Files/Sublime Text 3/sublime_text.exe" "$1"
}


extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1;;
			*.tar.gz) tar xvzf $1;;
			*.bz2) bunzip2 $1;;
			*.rar) unrar x $1;;
			*.gz) gunzip $1;;
			*.tar) tar xvf $1;;
			*.tbz2) tar xvjf $1;;
			*.tgz) tar xvzf $1;;
			*.zip) unzip $1;;
			*.Z) uncompress $1;;
			*.7z) 7za x $1;;
			*.rar) unrar $1;;
			*) echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}



mine(){ 
	user=${1-$USER};
	# list all results found
	git branch -a | grep origin/$user; 
	# get list of results, wc=get number of lines, pipe through echo output
	git branch -a | grep origin/$user | wc -l | xargs -I count echo there are count branches by $user; 
}

nuke(){
	git branch -a | grep origin/$USER | grep -o $USER.* | xargs -I line git push origin :line; 
}



sfind(){
	sublime `grep -rnF "$1"`
} 