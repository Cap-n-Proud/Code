apt-get autoremove -y mono-common
apt-get autoremove -y ttf-arabeyes ttf-arphic-uming ttf-indic-fonts-core ttf-kochi-gothic ttf-kochi-mincho ttf-lao ttf-malayalam-fonts ttf-thai-tlwg ttf-unfonts-core
apt-get autoremove -y ppp pppconfig pppoeconf wvdial
apt-get autoremove -y gnome-orca brltty brltty-x11 gnome-accessibility-themes gnome-mag libgnome-mag2
apt-get autoremove -y libgtk-vnc-1.0-0 vinagre vino
apt-get autoremove -y espeak espeak-data libespeak1 libgnome-speech7
sudo apt-get purge -y evolution-common evolution-data-server evolution-exchange evolution-plugins evolution-webcal
sudo apt-get purge -y fortune-mod
sudo apt-get purge -y libbeagle1
sudo apt-get purge -y contact-lookup-applet
sudo apt-get purge -y diveintopython
sudo apt-get purge -y example-content
sudo apt-get purge -y gnome-games gnome-games-data gnome-cards-data
sudo apt-get purge -y totem totem-gstreamer totem-plugins totem-common totem-mozilla

sudo apt-get remove -y task-desktop
sudo apt-get autoremove -y rhythmbox

sudo apt-get purge -y thunderbird firefox
sudo apt-get autoremove -y transmission-common transmission-gtk
sudo apt-get purge -y libreoffice* imagemagick* chromium*
