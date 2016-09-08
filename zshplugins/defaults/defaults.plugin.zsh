export EDITOR='ema'

# Default program launchers (rad zsh feature!)
for ext in 'png' 'jpeg' 'gif' 'jpg'; do
    alias -s ${ext}=feh
done

for ext in 'doc' 'docx' 'odt'; do
    alias -s ${ext}=libreoffice
done
