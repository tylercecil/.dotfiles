#!/usr/bin/env zsh

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    PLUGS=$HOME/.dotfiles/zshplugins   # plugin directory

    zgen oh-my-zsh
    zgen loadall <<EOF
    	aloxaf/fzf-tab
    	
        $PLUGS/colorcat
        $PLUGS/defaults
        $PLUGS/editor
        $PLUGS/fzf
        $PLUGS/git
        $PLUGS/go
        $PLUGS/ocaml
        $PLUGS/python
        $PLUGS/tex
        $PLUGS/theme
        $PLUGS/update
        $PLUGS/util
        $PLUGS/z
        $ZGEN_OH_MY_ZSH_REPO plugins/shrink-path
        zdharma/fast-syntax-highlighting
        zsh-users/zsh-completions
EOF
    zgen save
fi

# Set the path
export PATH=~/.local/bin:~/.bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/bin/core_perl
