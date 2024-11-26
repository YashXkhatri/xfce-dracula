cp -r config/.config ~/
cp -r config/.local ~/
cp -r config/dragon.jpg ~/.local/

xfconf-query -c xsettings -p /Net/ThemeName -s "Dracula"
xfconf-query -c xfwm4 -p /theme -s "Dracula"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Dracula Circle"
xfconf-query -c xfce4-panel -p /current-profile -s "Dracula"
xfconf-query -c xfdesktop -p /background/image-path -s "~/.config/dragon.jpg"
xfconf-query -c xfce4-session -p /startup/Terminal -n -t string -s "plank"
chmod +x set_shortcuts.sh
bash set_shortcuts.sh

xfce4-session-logout
