#!/bin/bash
cd "$(dirname "$0")" || exit
exec > >(tee -i install_log.txt)
exec 2>&1

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)
# Establecer la variable de entorno DISPLAY
export DISPLAY=:0
# Actualizando el sistema

sudo pacman -Syu --noconfirm

# Instalando dependencias de Entorno

packages=(abseil-cpp
acl
adobe-source-code-pro-fonts
adwaita-cursors
adwaita-icon-theme
adwaita-icon-theme-legacy
afpfs-ng
alsa-card-profiles
alsa-lib
alsa-topology-conf
alsa-ucm-conf
aom
apr
apr-util
archlinux-keyring
argon2
arp-scan
asciiquarium
at-spi2-core
atkmm
attr
audit
autoconf
automake
avahi
base
base-devel
bash
bat
binutils
binwalk
binwalk-debug
bison
blackarch-keyring
blas
bluez
bluez-libs
bluez-utils
borg
bridge-utils
brotli
bspwm
bubblewrap
burpsuite
bzip2
c-ares
ca-certificates
ca-certificates-mozilla
ca-certificates-utils
cairo
cairomm
cantarell-fonts
capstone
cblas
cifs-utils
cjson
clang
compiler-rt
containerd
coreutils
cryptsetup
curl
cython
dav1d
db
db5.3
dbus
dbus-broker
dbus-broker-units
dconf
debugedit
decodify
default-cursors
desktop-file-utils
device-mapper
diffutils
distcc
dmenu
docker
dotnet-host
dotnet-runtime
dotnet-sdk
dotnet-targeting-pack
double-conversion
duktape
e2fsprogs
efibootmgr
efivar
electron28
enchant
evil-winrm
exo
expat
exploitdb
fakeroot
feh
ffmpeg
fftw
file
filesystem
findutils
firefox
flac
flameshot
flex
fontconfig
freerdp
freerdp2
freetype2
fribidi
fuse-common
fuse2
fuse3
gawk
gc
gcc
gcc-libs
gd
gdbm
gdk-pixbuf2
gettext
ghostscript
giflib
git
glib-networking
glib2
glibc
glibmm
glslang
gmp
gnu-free-fonts
gnupg
gnutls
go
gobuster
google-chrome
gperftools
gpgme
gpm
graphite
graphviz
grep
groff
grub
gsettings-desktop-schemas
gsfonts
gsm
gssdp
gst-plugin-pipewire
gst-plugins-bad-libs
gst-plugins-base-libs
gstreamer
gtest
gtk-update-icon-cache
gtk2
gtk3
gtkmm
gts
guile
gupnp
gupnp-igd
gzip
harfbuzz
harfbuzz-icu
hashcat
hashid
hicolor-icon-theme
hidapi
highway
http-parser
hwdata
hwloc
hydra
hyphen
i3lock
iana-etc
icu
ijs
imagemagick
imath
imlib2
impacket
inetutils
intel-opencl-runtime
intel-opencl-runtime-debug
intel-ucode
iproute2
iptables
iputils
iso-codes
jansson
java-environment-common
java-runtime-common
jbig2dec
jbigkit
jdk-openjdk
john
jre8-openjdk
jre8-openjdk-headless
json-c
json-glib
jsoncpp
kbd
keepass
keyutils
kguiaddons5
kitty
kitty-shell-integration
kitty-terminfo
kmod
krb5
l-smash
lame
lapack
lcms2
ldb
libarchive
libass
libassuan
libasyncns
libavc1394
libavif
libb2
libbluray
libbpf
libbs2b
libbsd
libcamera
libcamera-ipa
libcap
libcap-ng
libcloudproviders
libcolord
libconfig
libcups
libcurl-compat
libdaemon
libdatrie
libde265
libdeflate-git
libdovi
libdrm
libdvdnav
libdvdread
libedit
libei
libelf
libepoxy
libev
libevdev
libevent
libexif
libfabric
libfbclient
libfdk-aac
libffi
libfontenc
libfreeaptx
libgcrypt
libgdiplus
libgit2
libglvnd
libgpg-error
libgtop
libgudev
libheif
libice
libidn
libidn2
libiec61883
libimobiledevice
libimobiledevice-glue
libinput
libisl
libjpeg-turbo
libjxl
libksba
liblc3
libldac
libldap
liblqr
libmanette
libmcrypt
libmd
libmemcached-awesome
libmm-glib
libmnl
libmodplug
libmpc
libmpdclient
libmspack
libmysofa
libndp
libnet
libnetfilter_conntrack
libnewt
libnfnetlink
libnftnl
libnghttp2
libnghttp3
libnice
libnl
libnm
libnotify
libnsl
libogg
libomxil-bellagio
libopenmpt
libp11-kit
libpaper
libpcap
libpciaccess
libpgm
libpipewire
libplacebo
libplist
libpng
libproxy
libpsl
libpulse
libraqm
libraw1394
librsvg
librsync
libsamplerate
libsasl
libseccomp
libsecret
libsigc++
libsm
libsndfile
libsodium
libsoup3
libsoxr
libssh
libssh2
libstemmer
libsysprof-capture
libtasn1
libteam
libthai
libtheora
libtiff
libtirpc
libtommath
libtool
libunibreak
libunistring
libunwind
liburing
libusb
libusbmuxd
libutempter
libutf8proc
libuv
libva
libvdpau
libverto
libvorbis
libvpl
libvpx
libwacom
libwbclient
libwebp
libwireplumber
libwpe
libx11
libxau
libxcb
libxcomposite
libxcrypt
libxcursor
libxcvt
libxdamage
libxdg-basedir
libxdmcp
libxext
libxfce4ui
libxfce4util
libxfixes
libxfont2
libxft
libxi
libxinerama
libxkbcommon
libxkbcommon-x11
libxkbfile
libxklavier
libxml2
libxmu
libxpm
libxrandr
libxrender
libxshmfence
libxslt
libxss
libxt
libxtst
libxv
libxxf86vm
libyaml
libyuv
licenses
lightdm
lightdm-gtk-greeter
lilv
linux
linux-api-headers
linux-firmware
linux-firmware-whence
llvm-libs
lm_sensors
lmdb
lsd
lsof
lua
lv2
lz4
lzo
m4
mailcap
make
mariadb-libs
mbedtls2
md4c
mesa
metasploit
mhash
mingw-w64-binutils
mingw-w64-crt
mingw-w64-gcc
mingw-w64-headers
mingw-w64-winpthreads
minizip
mkinitcpio
mkinitcpio-busybox
mobile-broadband-provider-info
mongo-c-driver
mono
mpdecimal
mpfr
mpg123
mtdev
nano
ncurses
ncurses5-compat-libs
neofetch
net-tools
netpbm
netstandard-targeting-pack
nettle
networkmanager
nitrogen
nmap
npth
nspr
nss
numactl
obsidian
ocl-icd
onetbb
oniguruma
openbsd-netcat
opencore-amr
openexr
openjpeg2
openldap
openmpi
openpmix
openssh
openssl
openucx
openvpn
opus
opusfile
orc
p11-kit
p7zip
pacman
pacman-contrib
pacman-mirrorlist
pam
pambase
pango
pangomm
patch
pciutils
pcre
pcre2
pcsclite
perl
perl-clone
perl-curses
perl-encode-locale
perl-error
perl-file-listing
perl-html-parser
perl-html-tagset
perl-http-cookiejar
perl-http-cookies
perl-http-daemon
perl-http-date
perl-http-message
perl-http-negotiate
perl-io-html
perl-libwww
perl-lwp-mediatypes
perl-mailtools
perl-net-http
perl-term-animation
perl-timedate
perl-try-tiny
perl-uri
perl-www-robotrules
picom-git
pinentry
pipewire
pipewire-alsa
pipewire-audio
pipewire-jack
pipewire-pulse
pixman
pkcs11-helper
pkgconf
plocate
polenum
polkit
polybar
poppler-data
popt
portaudio
portmidi
postgresql-libs
procps-ng
prrte
psmisc
python
python-annotated-types
python-argon2-cffi-bindings
python-argon2_cffi
python-attrs
python-autocommand
python-babel
python-blinker
python-cffi
python-chardet
python-charset-normalizer
python-click
python-coverage
python-cryptography
python-dateutil
python-docutils
python-fastjsonschema
python-flask
python-future
python-graphviz
python-guzzle-sphinx-theme
python-idna
python-imagesize
python-inflect
python-iniconfig
python-itsdangerous
python-jaraco.context
python-jaraco.functools
python-jaraco.text
python-jinja
python-ldap3
python-lxml
python-markupsafe
python-mock
python-more-itertools
python-msgpack
python-netifaces
python-nose
python-numpy
python-ordered-set
python-packaging
python-pbr
python-pcapy
python-pip
python-pkgconfig
python-platformdirs
python-pluggy
python-ply
python-py-cpuinfo
python-pyasn1
python-pyasn1-modules
python-pycparser
python-pycryptodome
python-pycryptodomex
python-pycurl
python-pydantic
python-pydantic-core
python-pygame
python-pygments
python-pyopenssl
python-pyparsing
python-pyqt5
python-pyqt5-sip
python-pytest
python-pytest-benchmark
python-pytest-cov
python-pytz
python-requests
python-scapy
python-setuptools
python-six
python-snowballstemmer
python-sphinx
python-sphinx-alabaster-theme
python-sphinxcontrib-applehelp
python-sphinxcontrib-devhelp
python-sphinxcontrib-htmlhelp
python-sphinxcontrib-jsmath
python-sphinxcontrib-qthelp
python-sphinxcontrib-serializinghtml
python-tomli
python-trove-classifiers
python-typeguard
python-typing_extensions
python-urllib3
python-validate-pyproject
python-werkzeug
python-wheel
python-wxpython
python2
qt5-base
qt5-declarative
qt5-graphicaleffects
qt5-location
qt5-quickcontrols2
qt5-remoteobjects
qt5-svg
qt5-translations
qt5-wayland
qt5-webchannel
qt5-webengine
qt5-x11extras
qt6-base
qt6-declarative
qt6-translations
rate-mirrors
rav1e
readline
responder
rlwrap
rofi
rubberband
ruby
ruby-abbrev
ruby-addressable
ruby-base64
ruby-benchmark
ruby-bigdecimal
ruby-bundledgems
ruby-bundler
ruby-cgi
ruby-csv
ruby-date
ruby-delegate
ruby-did_you_mean
ruby-digest
ruby-drb
ruby-english
ruby-erb
ruby-etc
ruby-fcntl
ruby-fiddle
ruby-fileutils
ruby-find
ruby-forwardable
ruby-getoptlong
ruby-io-console
ruby-io-nonblock
ruby-io-wait
ruby-ipaddr
ruby-irb
ruby-json
ruby-logger
ruby-minitest
ruby-mutex_m
ruby-net-http
ruby-open-uri
ruby-power_assert
ruby-psych
ruby-public_suffix
ruby-racc
ruby-rake
ruby-rdoc
ruby-reline
ruby-rexml
ruby-ruby2_keywords
ruby-stdlib
ruby-stringio
ruby-test-unit
ruby-time
ruby-tmpdir
ruby-uri
rubygems
runc
samba
sbc
scapy
scrot
sddm
sddm-sugar-dark
sddm-theme-sugar-candy-git
sdl2
sdl2_image
sdl2_mixer
sdl2_ttf
sed
serd
serf
shaderc
shadow
shared-mime-info
slang
smbclient
snappy
sord
speex
speexdsp
spirv-tools
sqlite
sqlmap
sratom
srt
startup-notification
steghide
subversion
sudo
svt-av1
sxhkd
systemd
systemd-libs
systemd-sysvcompat
talloc
tar
tcpdump
tdb
tevent
texinfo
thunar
tpm2-tss
tracker3
tslib
ttf-jetbrains-mono-nerd
ttf-liberation
tzdata
unixodbc
unzip
upower
usbmuxd
util-linux
util-linux-libs
v4l-utils
vapoursynth
vid.stab
vim
vim-runtime
visual-studio-code-bin
visual-studio-code-bin-debug
vmaf
vulkan-headers
vulkan-icd-loader
wayland
webkit2gtk-4.1
webrtc-audio-processing-1
wfuzz
wget
whatweb
which
wireplumber
wmname
woff2
wpa_supplicant
wpebackend-fdo
wpscan
wxwidgets-common
wxwidgets-gtk3
x264
x265
xcb-proto
xcb-util
xcb-util-cursor
xcb-util-image
xcb-util-keysyms
xcb-util-renderutil
xcb-util-wm
xcb-util-xrm
xclip
xdg-dbus-proxy
xdg-utils
xf86-input-libinput
xfconf
xkeyboard-config
xorg-fonts-encodings
xorg-server
xorg-server-common
xorg-setxkbmap
xorg-xauth
xorg-xkbcomp
xorg-xmodmap
xorg-xprop
xorg-xrandr
xorg-xrdb
xorg-xset
xorgproto
xvidcore
xxhash
xz
yay
yay-debug
zeromq
zimg
zix
zlib
zoom
zram-generator
zsh
zsh-autosuggestions
zsh-syntax-highlighting
ztd
)

sudo pacman -S --noconfirm "${packages[@]}" 

#Instalando yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Creando carpeta de Reposistorios

mkdir ~/github

# Descargar Repositorios Necesarios

cd ~/github
git clone --recursive https://github.com/polybar/polybar
git clone --recursive https://github.com/yshui/picom.git
# Instalando Polybar

cd ~/github/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$XDG_DATA_DIRS"
# Instalando Picom

cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Instalando p10k
cd ~/
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
sudo echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc

# Instando lsd

yay -S --noconfirm lsd

# Instalamos las HackNerdFonts

sudo cp -v $ruta/fonts/HNF/* /usr/share/fonts/
sudo cp -v $ruta/Config/resolution/* /etc/X11/xorg.conf.d/

# Instalando Fuentes de Polybar

sudo cp -v $ruta/Config/polybar/fonts/* /usr/share/fonts/truetype/

# Instalando Wallpaper

mkdir ~/Wallpaper
cp -v $ruta/Wallpaper/* ~/Wallpaper
mkdir ~/ScreenShots

# Copiando Archivos de Configuración

cp -rv $ruta/Config/* ~/.config/
sudo cp -rv $ruta/kitty /opt/

# Kitty Root

sudo cp -rv $ruta/Config/kitty /root/.config/

# Copia de configuracion de .p10k.zsh y .zshrc

rm -rf ~/.zshrc
cp -v $ruta/.zshrc ~/.zshrc

cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/.p10k.zsh-root /root/.p10k.zsh

# Script

sudo cp -v $ruta/scripts/whichSystem.py /usr/local/bin/
sudo cp -v $ruta/scripts/screenshot /usr/local/bin/

# Plugins ZSH
sudo mkdir -p /usr/local/share/fonts/
sudo mkdir -p /usr/share/fonts/truetype/
sudo mkdir /usr/share/zsh/plugins/zsh-sudo/
cd /usr/share/zsh/plugins/zsh-sudo/
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Cambiando de SHELL a zsh

sudo chsh -s /usr/bin/zsh
sudo usermod --shell /usr/bin/zsh root
sudo ln -s -fv ~/.zshrc /root/.zshrc

# Asignamos Permisos a los Scritps

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/htb_target.sh
chmod +x ~/.config/polybar/launch.sh
sudo chmod +x /usr/local/bin/whichSystem.py
sudo chmod +x /usr/local/bin/screenshot

# Habilitamos lightdm

sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service
#Ponemos una resolucion de 1920x1080

sudo cp -v $ruta/Config/resolution/* /etc/X11/xorg.conf.d/

yay -S --noconfirm burpsuite

#Instalando Nvim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Removiendo Repositorio

rm -rf ~/github
rm -rf $ruta

# Mensaje de Instalado

if command -v notify-send &>/dev/null; then
    notify-send "BSPWM INSTALADO"
else
    echo "BSPWM INSTALADO"
fi
