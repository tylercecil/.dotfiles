# Oh-my-zsh git plugin
antigen bundle git

# Git-ignore generator
function gi(){
    args=$(echo $@ | sed 's/ /,/g')
    curl -L -s https://www.gitignore.io/api/$args ;
}
