# ~/.profile

for f in ~/.config/environment.d/*.conf; do
	set -a; . "$f"; set +a
done
