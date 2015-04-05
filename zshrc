x#
# Setup Antigen
#
source .antigen/antigen.zsh
antigen use oh-my-zsh
antigen theme kennethreitz

#
# Antigen Bundles
#
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

antigen bundle virtualenvwrapper

antigen bundle cabal

antigen bundle web-search

#
# OS Specific things
#
if [[ `uname` == 'Darwin' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
fi

# Start X if needed
if [[ -z $DISPLAY && $XDG_VTNG -eq 1 ]]; then
    startx
fi

# Emacs Mode
if [[ -n ${INSIDE_EMACS} ]]; then
    unsetopt zle
fi

#
# Commands
#
alias rma='rm *~'

function mkcd(){
    mkdir $1;
    cd $1;
}

# python
alias p="python"
alias p2="python2"
alias p3="python3"
alias bp="bptyon"

# emacs
alias e="emacs"
alias ema="emacs"
alias enw="emacs -nw"

# navigation
alias j="z"
alias jb="cd -"
alias zb="cd -"

export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=' -R '

#
# Defaults
#
export EDITOR='ema'
export PATH=~/.cabal/bin:~/.bin:$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/bin/core_perl

#
# Apply Antigen
#
antigen apply

# OPAM configuration
. /Users/tylercecil/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
