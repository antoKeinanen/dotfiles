gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
rm -f ~/.config/colors/theme.css 
ln -s ~/.config/colors/theme-dark.css ~/.config/colors/theme.css

~/.config/scripts/reload-apps.sh
