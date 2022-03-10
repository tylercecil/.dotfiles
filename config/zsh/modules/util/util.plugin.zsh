# Some personal commands I like, that have no categorization

alias rma='rm *~'
alias rma!='rm ./*~ ./.*~'

function mkdircd(){
    mkdir $1;
    cd $1;
}
alias mkcd=mkdircd

function mvcd(){
    mv $1 $2;
    cd $1;
}

alias resource="source ~/.zshrc"
