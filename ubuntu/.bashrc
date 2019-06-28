# Terminal config
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]'
NC='\[\e[0;0m\]' # No Color

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="${LIGHTBLUE}\\u${NC}@${RED}\h ${BOLDYELLOW}\w${PURPLE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"

# Ruby config
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cooool functions
function github() {
  #call from a local repo to open the origin repository on github in browser
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git//}
  echo $giturl
  open $giturl
}

function githubog() {
  #call from a local repo to open the upstream repository on github in browser
  giturl=$(git config --get remote.upstream.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git//}
  echo $giturl
  open $giturl
}

###############################
##         Aliases           ##
###############################
###################
###### osx ########
###################
alias reload='source ~/.bashrc'
alias versions="docker -v && python3 -V && ruby -v && rails -v && echo -ne node\ && node -v && echo -ne npm\ && npm -v"
alias ls='ls -l'
alias ..='cd ..'
alias back='cd -'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cwd='pwd | tr -d "\r\n" | pbcopy' #copy working directory
alias grep='grep -n'
alias ppath="echo $PATH | tr ':' '\n'" #print path




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
