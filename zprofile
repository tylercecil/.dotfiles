# PATH
PATH="$HOME/.local/bin:$HOME/bin:$PATH"

if [[ $OSTYPE == 'darwin'* ]]; then
	# MacOS Config
	export HOMEBREW_PREFIX="/opt/homebrew";
	export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
	export HOMEBREW_REPOSITORY="/opt/homebrew";
	export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
	export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
	export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
else
	#Linux Config
	# ibus variables
	export GTK_IM_MODULE=ibus
	export XMODIFIERS=@im=ibus
	export QT_IM_MODULE=ibus

	# Start X if that's needed
	if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
		exec startx
	fi
fi
