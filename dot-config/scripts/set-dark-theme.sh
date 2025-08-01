gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

spicetify config color_scheme mocha

rm -f ~/.config/colors/theme.css 
ln -s ~/.config/colors/theme-dark.css ~/.config/colors/theme.css

~/.config/scripts/reload-apps.sh
