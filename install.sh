#!/bin/bash
if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)
# Establecer la variable de entorno DISPLAY
export DISPLAY=:0
# Actualizando el sistema

sudo pacman -Syu --noconfirm

# Instalando dependencias de Entorno
sudo pacman -S --noconfirm feh scrot scrub zsh rofi xclip bat locate neofetch wmname acpi bspwm sxhkd imagemagick ranger kitty picom wget base-devel git vim xcb-util-keysyms xcb-util-wm xcb-util-xrm alsa-lib xcb-util-cursor xorg-xdpyinfo xorg-server polybar zsh-autosuggestions firefox cmake ninja make

# Instalando Requerimientos para la polybar
sudo pacman -S --noconfirm cmake ninja gcc pkg-config python-sphinx cairo xcb-util-image xcb-util-wm xcb-util-cursor xcb-util-renderutil xcb-util-errors libpulse jsoncpp libmpdclient libnl libuv

# Dependencias de Picom
sudo pacman -S --noconfirmmeson libxext libxcb libxdamage libxfixes libxshmfence pixman dbus libconfig libgl pcre uthash libev libx11 libxcb xorg-server xorg-xinit xterm xorg-xclock xorg-xprop librsvg gdk-pixbuf2

# Instalando paquetes adicionales
sudo pacman -S --noconfirm feh scrot zsh xclip bat mlocate neofetch sxhkd bspwm ranger kitty lightdm lightdm-gtk-greeter net-tools python3 imagemagick libheif libid3tag 

#Instalando herramientas de pentesting

sudo pacman -S --noconfirm nmap exploitdb wireshark hydra john openvpn

#Instalando yay
:
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Creando carpeta de Reposistorios

mkdir ~/github

# Descargar Repositorios Necesarios

cd ~/github
git clone --recursive https://github.com/polybar/polybar
git clone --recursive https://github.com/ibhagwan/picom.git
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
