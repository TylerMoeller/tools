export PS1="\[\033[36m\]\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=DxFxBxFxCxegedabagacad

alias desk='cd ~/Desktop'
alias dir='ls -lAF'
alias ll='ls -lAF'
alias ls='ls -GFh'
alias cd..='cd ..'
alias ..='cd ..'
alias nukedd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias clearsims='xcrun simctl erase all'
alias ddata='cd ~/Library/Developer/Xcode/DerivedData'

# cmd style tab completion
bind 'set completion-ignore-case on'
bind 'TAB':menu-complete
