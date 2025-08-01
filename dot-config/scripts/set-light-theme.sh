gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
rm -f ~/.config/colors/theme.css 
ln -s ~/.config/colors/theme-light.css ~/.config/colors/theme.css

~/.config/scripts/reload-apps.sh
