# Cleanup a working tex directory
fucntion texclean() {
    setopt null_glob
    rm -rfv *.aux *.log *.toc auto *.out *.snm *.nav
    rm -ri *.pdf build
    unsetopt null_glob
}
