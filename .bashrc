# .bashrc

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------
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

DISPLAY=$(hostname)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Color definitions (taken from Color Bash Prompt HowTo).
#-------------------------------------------------------------
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset
ALERT=${BWhite}${On_Red} # Bold White on red background


echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan} on ${BRed}$DISPLAY${NC}\n"
date

function __git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!DIRTY!"
}

function __git_branch {
  __git_ps1 "(%s)"
}

bash_prompt() {
  # time and user@host
  PS1="\A \[${BCyan}\]\u\[${NC}\]@\[${Green}\]\h\[${NC}\] "
  # path
  PS1+="\w "
  # git branch
  PS1+="\[${Yellow}\]\$(__git_branch)"
  # is committed?
  PS1+="\[${ALERT}\]\$(__git_dirty)\[${NC}\]$ "
}

bash_prompt
unset bash_prompt


export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

#-------------------------------------------------------------
# The 'ls' family
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll | less'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

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
alias psgp=gpps
alias myps='ps aux | grep $USER'
alias psmy=myps

alias killme='killall -u $USER'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# alias history="history | less"
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv' #make parent dirs if needed
alias mount='mount | column -t'

alias ipf='ipconfig //flushdns'

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
# work aliases
#-------------------------------------------------------------
export USERDIR=/home/$USER/

alias embs='cd $USERDIR/www/UD_ember/UD/;rm -rf tmp/;ember server'
alias embp="cd $USERDIR/www/UD_ember/UD/;ember build --prod"

alias home='cd $USERDIR'
alias cdww="cd $USERDIR/www/"
alias cdmod="cd $USERDIR/includes/"
alias cdcrn="cd $USERDIR/crons/"
alias cdemb="cd $USERDIR/www/UD_ember/UD"
alias cdtemb="cd $USERDIR/www/teamdb_ember/teamdb"

code(){
    cd ~/Documents/codebase/"$1"
}

alias devCenter="cd $USERDIR/www/devCenter/server/"
alias devC="devCenter; nohup gunicorn index.py prod --log-level debug --timeout 60000 &"
alias devCbeta="devCenter; nohup gunicorn index.py prod beta --log-level debug --timeout 60000 &"
alias devCbetanow="devCenter; nohup gunicorn index.py prod beta betanow --log-level debug --timeout 60000 &"

em () { 
    cd $USERDIR/www/"$1"/UD_ember/UD/
}

alias rmbn='rm -rdf node_modules && rm -rdf bower_components'
alias adbn='bower install && npm install'
alias chbn='bower cache clean && npm cache clean'
alias embr='rmbn && chbn && adbn'

alias morb='morbo -l http://*:28173 -w /$USERDIR/includes/ -w $USERDIR/www/UD_api/ ud_server.pl'
alias tmorb='morbo -l http://*:28173 -w $USERDIR/includes/ -w $USERDIR/www/teamdbapi/ teamdb.pl'

alias hyp='hypnotoad $USERDIR/www/UD_api/ud_server.pl'
alias hyps='hypnotoad -s $USERDIR/www/UD_api/ud_server.pl'

alias thyp='hypnotoad $USERDIR/www/teamdbapi/teamdb.pl'
alias thyps='hypnotoad -s $USERDIR/www/teamdbapi/teamdb.pl'

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

alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbi='git rebase -i'

alias gfor='git fetch origin'
alias gplo='git pull origin '
alias grsa="git reset --hard origin/"
alias grebs='git rebase'

gcomp(){
    gadd .; gcom "$1";gpsh;glgs
}

gacph(){
    CM="automated commit"
    if [ $# -eq 1 ]
        then
            CM="$1"
    fi

    git add .;git commit -m "$CM";git push;
}

gcph(){
    dt=$(date '+%d/%m/%Y %H:%M:%S')
    gcom "automated commit $dt"
    gpsh
}
# alias gcph='gcom "automated commit";gpsh'
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


gdel() {
    grsh "$1";
    git clean -fd;
    git pull;
    git status
}



#  create new alias from cmd line
# ALIASES=~/.aliases
# function add_alias {
#    echo "alias $1='$2'" >> $ALIASES;
#    echo Adding alias: `tail -1 $ALIASES`;
#    source $ALIASES;
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
    py_script="
import urllib.parse
import sys
print(urllib.parse.quote(' '.join(sys.argv[1:])))
"
    queries=$(python -c "$py_script" "$@")
    python -mwebbrowser http://google.com/search?q="$queries"
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