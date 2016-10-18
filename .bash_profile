## Beau Bouchard 
## .bash_profile

# Git branch in prompt

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# wallpaper is to change the current wallpaper to an image on mac only
# great for scripting download of wallpaper and automating changing it. 
wallpaper() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

# getting abspath on mac, which i use for the wallpaper function
getAbsolutePath(){
    [[ -d $1 ]] && { cd "$1"; echo "$(pwd -P)"; } ||
    { cd "$(dirname "$1")"; echo "$(pwd -P)/$(basename "$1")"; }
}

# PS1
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Other Exports


## Aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias ..="cd .."
alias fhere="find . -name "
alias df="df -Tha --total"
alias ps="ps auxf"
alias jf="ps -ef"
# CD Project base home
alias cdh="cd ~/Projects/"
