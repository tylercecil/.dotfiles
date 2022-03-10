update () {
    if [[ `uname` == 'Darwin' ]]; then
        # This assumes the oh-my-zsh brew plugin is installed
        bubu
    elif [[ `uname` == 'Linux' ]]; then
         # Are we debian or arch?
        if command -v apt-get > /dev/null 2>&1; then
            sudo apt-get update; sudo apt-get upgrade
        elif command -v yaout; then
            yaourt -Syu --aur
        fi
    fi
}
