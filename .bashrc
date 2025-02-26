# ~/.bashrc #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export EDITOR=nvim
export VISUAL=nvim


### ALIASES ###
# system aliases
alias ls='ls -lhp --color=auto'
alias la='ls -lahp --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias vi='nvim'
alias vim='nvim'
alias reboot='read -p "Are you sure you want to reboot? (y/n): " && [[ $REPLY =~ ^[Yy]$ ]] && reboot'
# git aliases
alias ga='git add'
alias gs='git status'
alias gc='git commit'


### HISTORY CONTROL ###
HISTCONTROL=ignoredups:ignorespace:erasedups
#HISTIGNORE='ls*:cd*:pwd*:whoami*:cp*:mv*:history*'
HISTFILESIZE=-1 #unlimit
HISTSIZE=-1 	#unlimit

### SHOPT ###
shopt -s checkwinsize
shopt -s histappend
shopt -s checkjobs
shopt -s cmdhist
shopt -s autocd

### PS[0-4] and PROMT_COMMAND ###
PS1='\[\e[0;33m\]$(git_branch)\[\e[m\]\[\e[0;32m\][\u@\H]\[\e[m\]-\[\e[0;34m\][\w]\[\e[m\] \[\e[0;90m\]\D{%d:%b:%Y-%H:%M:%S} \n\[\e[1;32m\]::: \[\e[m\]'
PROMPT_COMMAND='history -a; history -n;'



### FUNCTIONS ###
# Display the current Git branch in the Bash prompt.
git_branch() {
  local branch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [[ -n $branch ]]; then
    local status=$(git status --porcelain 2>/dev/null)
    [[ -n $status ]] && branch+="*"
    echo "($branch)"
  fi
}

