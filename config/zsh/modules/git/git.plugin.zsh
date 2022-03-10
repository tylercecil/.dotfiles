# Oh-my-zsh git plugin
zgen oh-my-zsh plugins/git
# I use g for something else
unalias g

# Git-ignore generator
function gi(){
    args=$(echo $@ | sed 's/ /,/g')
    curl -L -s https://www.gitignore.io/api/$args ;
}
