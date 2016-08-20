#
# Setup Antigen
#
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh

#
# Antigen Bundles
#
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

antigen bundle virtualenvwrapper
antigen bundle stack
antigen bundle web-search

#
# Antigen Theme
#
if [[ -n ${INSIDE_EMACS} ]]; then
    antigen theme imajes
else
    antigen theme kennethreitz
fi

#
# OS Specific things
#
if [[ `uname` == 'Darwin' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
fi

# Start X if needed
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx


#
# Commands
#
alias rma='rm *~'
function mkdircd(){
    mkdir $1;
    cd $1;
}

function mvcd(){
    mv $1 $2;
    cd $1;
}

function gi(){
    args=$(echo $@ | sed 's/ /,/g')
    curl -L -s https://www.gitignore.io/api/$args ;
}
fucntion texclean() {
	setopt null_glob
	rm -rfv *.aux *.log *.toc auto *.out *.snm *.nav
	rm -ri *.pdf build
	unsetopt null_glob
}

# Colored Readers
alias ccat='pygmentize -g'
export LESSOPEN='| pygmentize -g %s'

# python
alias p="python"
alias p2="python2"
alias p3="python3"
alias bp="bpython"
alias pc="p -c"

# emacs
alias e="emacs"
alias enw="emacs -nw"
alias ec="emacsclient"
alias ecn="emacsclient -n"
alias ecnc="emacsclient -nc"
alias ecnw="emacsclient -nw"

# navigation
alias j="z"
alias jb="cd -"
alias zb="cd -"

# pacman / yaort
alias yup="yaourt -Syu --aur"
alias yup!="yaourt -Syu --aur --noconfirm"

# zsh
alias resource="source ~/.zshrc"

# Default program launchers
for ext in 'png' 'jpeg' 'gif' 'jpg'; do
    alias -s ${ext}=feh
done

for ext in 'doc' 'docx' 'odt'; do
    alias -s ${ext}=libreoffice
done

#
# Defaults
#
export EDITOR='ema'
export PATH=~/.local/bin:~/.bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin/core_perl

#
# Apply Antigen
#
antigen apply

# Go Lang config
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin

# OPAM configuration
. /Users/tylercecil/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
