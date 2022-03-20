ZIM_HOME=~/.config/zsh/zim
ZDOTDIR=~/.config/zsh/

# Used by zsh-tab-title module
ZSH_TAB_TITLE_ADDITIONAL_TERMS='alacritty'
ZSH_TAB_TITLE_ONLY_FOLDER=true

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh
