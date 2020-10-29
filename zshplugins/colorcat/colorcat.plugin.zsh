# Colored Readers
# alias ccat='pygmentize -g'
# export LESSOPEN='| pygmentize -g %s'

# I've switched to using [bat](https://github.com/sharkdp/bat):
alias cat='bat'
alias less='bat'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Solarized (light)"
