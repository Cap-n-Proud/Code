#!/bin/bash

#http://newznab.readthedocs.io/en/latest/guides/install_ubuntu-14.04/

HEADLESS=Y
STRIPALL=Y
OPTIMIZE=Y
NEWZNAB_DIR="/var/www/newznab/"
HDD_MOUNT="/media/usb/"

read -p "Running Headless? [$HEADLESS]: " -e t1
if [ -n "$t1" ]; then HEADLESS="$t1";fi

read -p "Remove extra Packages? [$STRIPALL]: " -e t1
if [ -n "$t1" ]; then STRIPALL="$t1";fi

read -p "Optimize system? [$OPTIMIZE]: " -e t1
if [ -n "$t1" ]; then OPTIMIZE="$t1";fi

read -p "Optimize system? [$NEWZNAB_DIR]: " -e t1
if [ -n "$t1" ]; then NEWZNAB_DIR="$t1";fi

read -p "Optimize system? [$HDD_MOUNT]: " -e t1
if [ -n "$t1" ]; then HDD_MOUNT="$t1";fi

df -h
START=$SECONDS
echo -n START

#list all installed packages: dpkg --get-selections see https://help.ubuntu.com/community/Diet%20Ubuntu
if [ "$HEADLESS" == "Y" ]
then
{
echo "*** Running headless ***"

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



} #>> log.txt

else
    echo "No extra packages removed"
fi


if [ "$STRIPALL" == "Y" ]
then
{
echo "*** Deep removal ***"

sudo apt-get purge -y abiword abiword-common abiword-plugin-grammar abiword-plugin-mathview accountsservice acl alsa-base alsa-utils anthy anthy-common apport apport-gtk apport-symptoms aria2 aspell audacious audacious-plugins:armhf audacious-plugins-data autopoint axel bind9-host blueman bluez bluez-alsa:armhf bluez-cups camorama chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra colord cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-driver-gutenprint cups-filters cups-filters-core-drivers cups-ppdc cups-server-common deadbeef dmz-cursor-theme docbook docbook-dsssl docbook-to-man docbook-xml docbook-xsl evince evince-common evolution-data-server-common extra-xdg-menus faenza-icon-theme fbset ffmpegthumbnailer filezilla filezilla-common file-roller flite1-dev:armhf fontconfig fontconfig-config fonts-arabeyes fonts-arphic-ukai fonts-arphic-uming fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-farsiweb fonts-freefont-ttf fonts-kacst fonts-kacst-one fonts-khmeros fonts-khmeros-core fonts-lao fonts-liberation fonts-lklug-sinhala fonts-lyx fonts-manchufont fonts-mgopen fonts-nafees fonts-nanum fonts-nanum-coding fonts-opensymbol fonts-sil-abyssinica fonts-sil-ezra fonts-sil-gentium fonts-sil-gentium-basic fonts-sil-padauk fonts-sil-scheherazade fonts-takao-gothic fonts-takao-mincho fonts-takao-pgothic fonts-thai-tlwg fonts-tibetan-machine fonts-tlwg-garuda fonts-tlwg-kinnari fonts-tlwg-loma fonts-tlwg-mono fonts-tlwg-norasi fonts-tlwg-purisa fonts-tlwg-sawasdee fonts-tlwg-typewriter fonts-tlwg-typist fonts-tlwg-typo fonts-tlwg-umpush fonts-tlwg-waree fonts-ukij-uyghur fonts-unfonts-core foomatic-db-compressed-ppds fuse libfontconfig1 libgtk2.0.0 libpango-1.0.0 libqt5widgets5 snappy transmission-qt transmission-cli foomatic-filters gir1.2* zenity-common yelp-xsl yasm xvfb xtrans-dev xsltproc xserver-common xscreensaver-data xscreensaver-screensaver-bsod x11-common xfconf xfce4-dev-tools xfce4-power-manager-data xdg-utils xauth xbitmaps xdg-user-dirs xkb-data xorg-docs-core xorg-sgml-doctools autoconf autoconf2.13 automake autotools-dev avr-libc avrdude binutils binutils-avr build-essential ccache cdbs cmake cmake-data comerr-dev command-not-found-data cpp cpp-4.8 desktop-file-utils dpkg-dev fakeroot firefox-locale-en flex bison g++ g++-4.8 gcc gcc-4.8 gcc-avr gconf-service gconf-service-backend gconf2 gconf2-common gdb gdebi-core genisoimage giblib1:armhf glmark2-data glmark2-es2 gnome-accessibility-themes gnome-desktop-data gnome-desktop3-data gnome-menus gnome-panel-data gnome-pkg-tools gnome-themes-standard-data gnumeric-common gobject-introspection gstreamer0.10-nice:armhf gstreamer0.10-plugins-base:armhf gsfonts gsettings-desktop-schemas gstreamer0.10-plugins-base:armhf gstreamer1.0-alsa:armhf gstreamer1.0-doc gstreamer1.0-libav:armhf gstreamer1.0-plugins-bad-doc gstreamer1.0-plugins-base:armhf gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-base-doc gstreamer1.0-plugins-good-doc gstreamer1.0-pulseaudio:armhf  gstreamer1.0-tools gvfs-common gvfs-libs:armhf hicolor-icon-theme hplip-data hunspell-en-us imagemagick-common java-common jade joe kerneloops-daemon ladspa-sdk laptop-detect lightdm link-grammar-dictionaries-en lintian linux-sound-base lubuntu-lxpanel-icons openjdk-7-jre ca-certificates-java aspell aspell-en fonts-dejavu-core lxmenu-data lxsession-data m4 make maliddx mc mc-data mesa-utils mesa-utils-extra metacity-common mircommon-dev:armhf mobile-broadband-provider-info modemmanager mysql-common nautilus-data netpbm obex-data-server openprinting-ppds p11-kit p11-kit-modules:armhf pastebinit pcmciautils pidgin-data policykit-desktop-privileges poppler-data printer-driver-c2esp printer-driver-foo2zjs-common printer-driver-min12xxw pulseaudio python-cups python-cupshelpers qpdf quilt rfkill samba-common samba-common-bin samba-libs:armhf sgml-base sgml-data sgmlspl smbclient sound-theme-freedesktop swig swig2.0 sylpheed-doc system-config-printer-common system-config-printer-udev t1utils transmission-common tsconf ttf-bengali-fonts ttf-devanagari-fonts ttf-gujarati-fonts ttf-indic-fonts-core ttf-kannada-fonts ttf-malayalam-fonts ttf-oriya-fonts ttf-punjabi-fonts ttf-tamil-fonts ttf-telugu-fonts ttf-ubuntu-font-family usbmuxd uvcdynctrl uvcdynctrl-data valgrind whoopsie wireless-tools wpasupplicant wvdial x11-xfs-utils xbmc xinput xserver-xorg-core xfce4-power-manager xfonts-100dpi xfonts-base xfonts-mathml xfonts-scalable xfonts-utils xinit xdg-user-dirs-gtk xdg-user-dirs xarchiver x11proto-xinerama-dev x11proto-xf86vidmode-dev x11proto-xf86dri-dev x11proto-xcmisc-dev x11proto-video-dev x11proto-record-dev x11proto-randr-dev x11proto-present-dev x11proto-kb-dev x11proto-dri3-dev x11proto-dri2-dev x11proto-dmx-dev x11proto-bigreqs-dev dictionaries-common libavc1394-0:armhf libavresample1:armhf libavutil52:armhf libbluetooth3:armhf libbluray1:armhf libbonobo2-common libbonoboui2-common libboost-atomic1.54.0:armhf libboost-chrono1.54.0:armhf libboost-date-time1.54.0:armhf libboost-serialization1.54.0:armhf libboost-system1.54.0:armhf libboost-thread1.54.0:armhf libbs2b0 libburn4 libcaca0:armhf libcamel-1.2-45 libcdaudio1 libcddb2 libcdio-cdda1 libcdio-paranoia1 libcdio13 libcdparanoia0:armhf libcdt5 libcec libcgraph6 libcogl15:armhf  libcolamd2.8.0:armhf libcolord1:armhf libcolorhug1:armhf libcompfaceg1 libcrack2:armhf libcroco3:armhf libcue1 libcups2:armhf libcupscgi1:armhf libcupsfilters1:armhf libcupsimage2:armhf libcupsmime1:armhf libcupsppdc1:armhf libdatrie1:armhf libdc1394-22:armhf libdca0:armhf libdirac-decoder0:armhf libdirac-encoder0:armhf libdiscid0:armhf libdjvulibre-text libdjvulibre21:armhf libdmx1:armhf libdrm-nouveau2:armhf libdrm-radeon1:armhf libdv4:armhf libdvdnav4:armhf libdvdread4:armhf libegl1-mesa:armhf libdrm-omap1:armhf libegl1-mesa-drivers:armhf libexo-common libexo-helpers libfaad2:armhf libfakeroot:armhf libfftw3-bin libfftw3-double3:armhf libfftw3-single3:armhf libflac8:armhf libfontembed1:armhf libfontenc1:armhf libframe6:armhf libfreetype6:armhf libfribidi0:armhf libfs6:armhf libftdi1:armhf libfuse2:armhf libgbm1:armhf libgck-1-0:armhf libgcr-3-common libgcr-base-3-1:armhf libgda-5.0-common libgdk-pixbuf2.0-0:armhf libgdk-pixbuf2.0-common libgdome2-0 libgdome2-cpp-smart0c2a libgeis1:armhf libgeoclue0:armhf libgeoip1:armhf libgif4:armhf libgirepository-1.0-1 libgl1-mesa-dri:armhf libgl1-mesa-glx:armhf libglapi-mesa:armhf libgles1-mesa:armhf libgles2-mesa:armhf libglib2.0-doc libglib-perl libgme0 libgmpxx4ldbl:armhf libgnome-keyring-common libgnome-keyring0:armhf libgnome-menu-3-0 libgnomecanvas2-common libgnomeui-common libgoffice-0.10-10-common libgomp1:armhf libgphoto2-port10:armhf libgraphite2-3:armhf libgs9-common libgsf-1-114 libgsf-1-common libgsl0ldbl libgsm1:armhf libgstreamer-plugins-base0.10-0:armhf libgstreamer-plugins-base1.0-0:armhf libgstreamer0.10-0:armhf libgstreamer1.0-0:armhf libgtk-3-common libgtk2.0-common libgtop2-7 libgtop2-common libgudev-1.0-0:armhf libguess1:armhf libgusb2:armhf libgutenprint2 libgweather-common libhogweed2:armhf libhpmud0 libhunspell-1.3-0:armhf libibus-1.0-5:armhf libical1 libid3tag0 libieee1284-3:armhf libijs-0.35 libilmbase6:armhf libimage-exiftool-perl libiptcdata0 libisofs6 libiw30:armhf libjack-jackd2-0:armhf libjasper1:armhf libjavascriptcoregtk-3.0-0:armhf libjbig0:armhf libjbig2dec0 libjna-java  libjpeg-turbo8:armhf libjpeg8:armhf libjs-jquery libjte1 libkate1 liblavjpeg-2.1-0 liblcms2-2:armhf  liblircclient0 libllvm3.4:armhf liblockfile-bin liblockfile1:armhf libloudmouth1-0 liblqr-1-0:armhf libltdl7:armhf liblua5.2-0:armhf libmad0:armhf libmbim-glib0:armhf libmeanwhile1 libmenu-cache-bin libmenu-cache3 libmessaging-menu0 libmicrohttpd10 libmikmod2:armhf libmimic0 libmirprotobuf0:armhf libmjpegutils-2.1-0 libmms0:armhf libmodplug1 libmp3lame0:armhf libmpcdec6 libmpeg2-4:armhf libmpeg2encpp-2.1-0 libmpg123-0:armhf libmplex2-2.1-0 libmtdev1:armhf libmtp-common libmtp-runtime libmtp9:armhf libnetpbm10 libnettle4:armhf libobt2 libogg0:armhf libopenal-data libopenal1:armhf libopencv-calib3d2.4:armhf libopencv-core2.4:armhf libopencv-features2d2.4:armhf libopencv-flann2.4:armhf libopencv-gpu2.4:armhf libopencv-imgproc2.4:armhf  libopencv-ml2.4:armhf  libopencv-photo2.4:armhf libopencv-stitching2.4:armhf libopencv-video2.4:armhf libopenjpeg2:armhf libopenobex1 libopenvg1-mesa:armhf liborbit-2-0:armhf liborc-0.4-0:armhf libots0 libp11-kit-gnome-keyring:armhf libpam-gnome-keyring:armhf libpaper-utils libpaper1:armhf libpathplan4 libpcsclite1:armhf consolekit libpixman-1-0:armhf libpixman-1-0-dbg:armhf libplist1:armhf libpolkit-agent-1-0:armhf libpolkit-backend-1-0:armhf libpolkit-gobject-1-0:armhf libpostproc52 libprotobuf8:armhf libprotobuf-lite8:armhf libproxy1:armhf libqmi-glib0:armhf libqpdf13:armhf libquvi-scripts libraptor2-0:armhf librarian0 librasqal3:armhf libraw1394-11:armhf librxtx-java libsamplerate0:armhf libsane-common libsbc1:armhf libschroedinger-1.0-0:armhf libsecret-1-0:armhf libsecret-common libshairplay libsidplayfp:armhf libsoundtouch0:armhf libsp1c2 libspeex1:armhf libspeexdsp1:armhf libsrtp0 libt1-5 libtag1-vanilla:armhf libtag1c2a:armhf libtagc0:armhf libtcl8.6:armhf libtelepathy-glib0:armhf libthai-data libtheora0:armhf libudisks2-0:armhf libusbmuxd2 libv4l2rds0:armhf libva1:armhf libvdpau1:armhf libvisual-0.4-0:armhf libvo-aacenc0:armhf libvo-amrwbenc0:armhf libvpx1:armhf libvte-2.90-common libvte-common  libwavpack1:armhf  libwayland-client0:armhf libwayland-cursor0:armhf libwayland-server0:armhf libwbclient0:armhf libwebcam0 libwebkitgtk-3.0-common libwebp5:armhf libwebpdemux1:armhf libwebpmux1:armhf libwhoopsie0 libwildmidi-config libwildmidi1:armhf libwnck-3-common libwnck-common libwpd-0.9-9 libwpg-0.2-2 libwps-0.2-2 libwvstreams4.6-base libwvstreams4.6-extras libx11-6:armhf  libx11-data  libx11-xcb1:armhf libx264-142:armhf libxapian22 libxau6:armhf libxcb-dri2-0:armhf libxcb-dri3-0:armhf libxcb-glx0:armhf  libxcb-icccm4:armhf libxcb-image0:armhf libxcb-keysyms1:armhf libxcb-present0:armhf libxcb-randr0:armhf libxcb-render0:armhf libxcb-shape0:armhf libxcb-shm0:armhf libxcb-sync1:armhf libxcb-util0:armhf  libxcb-xf86dri0:armhf libxcb-xfixes0:armhf libxcb-xv0:armhf libxcb1:armhf   libxcomposite1:armhf libxcursor1:armhf libxdamage1:armhf  libxdmcp6:armhf libxdot4 libxext6:armhf libxfce4ui-common  libxfce4util-common libxfce4util6 libxfixes3:armhf libxi6:armhf libxinerama1:armhf libxkbfile1:armhf libxp6:armhf



} #>> log.txt

else
    echo "No deep packages removed"
fi

echo -e "***** Updating system packages *****" 
{
sudo apt-get -y autoremove && sudo apt-get -y clean all && sudo apt-get -y autoclean all
sudo apt-get -f install
sudo apt-get -y update
sudo apt-get -y upgrade

} #>> log.txt

echo -e "***** Installing PHP5 *****" 
{
sudo apt-get install -y php5 php5-dev php-pear php5-gd php5-mysql php5-curl
} #>> log.txt


echo -e "***** Installing Percona and TokuDb *****" 
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev

echo -e "***** Installing apache and support  *****" 
sudo apt-get install -y apache2
sudo apt-get install -y nano
sudo apt-get install -y unrar
sudo apt-get install -y lame
sudo apt-get install -y mediainfo
sudo apt-get install -y subversion
sudo apt-get install -y screen tmux

sudo gpg --keyserver  hkp://keys.gnupg.net --recv-keys B9D8946B16932B16
sudo gpg -a --export 16932B16 | sudo apt-key add -
sudo sh -c "echo \"deb http://ppa.launchpad.net/builds/sphinxsearch-daily/ubuntu precise main \ndeb-src http://ppa.launchpad.net/builds/sphinxsearch-daily/ubuntu precise main\" >> /etc/apt/sources.list"
sudo apt-get -y update
sudo apt-get install -y sphinxsearch

sudo apt-get install -y phpmyadmin

cd /var/www
sudo mkdir newznab
sudo chmod 777 newznab
sudo svn co svn://svn.newznab.com/nn/branches/nnplus /var/www/newznab

sudo chmod 777 $NEWZNAB_DIR/www/lib/smarty/templates_c
sudo chmod 777 $NEWZNAB_DIR/www/covers/movies
sudo chmod 777 $NEWZNAB_DIR/www/covers/anime
sudo chmod 777 $NEWZNAB_DIR/www/covers/music
sudo chmod 777 $NEWZNAB_DIR/www
sudo chmod 777 $NEWZNAB_DIR/www/install
sudo chmod 777 $NEWZNAB_DIR/nzbfiles/


#Adding lines to a file, note the '>>'
cat<<EOF>/etc/apache2/sites-available/newznab.conf

<VirtualHost *:80>
        <Directory $NEWZNAB_DIRwww/>
            Options FollowSymLinks
            AllowOverride All
            Order allow,deny
            allow from all
        </Directory>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/newznab/www
    LogLevel warn
    ServerSignature Off
</VirtualHost>

EOF
  rc=$?
  if [[ $rc != 0 ]] ; then
    echo -en "[FAIL]\n"
    echo ""
    exit $rc
  else
    echo -en "[OK]\n"
  fi
#  echo -en "[OK]\n"

sudo service apache2 stop
sudo a2dissite 000-default.conf
sudo a2ensite newznab
sudo a2enmod rewrite
sudo service apache2 start


#sed  -i.bak -e 's/DBName=.*/DBName=database/' \
# -e 's/#* *DBHost=.*/DBHost=localhost/' \
# -e 's/#* *DBPassword=.*/DBPassword=password/' config.file

