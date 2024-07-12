#!/bin/bash
if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)
# Establecer la variable de entorno DISPLAY
export DISPLAY=:0

# Aumentando las capacidades de pacman 

sudo cp -v $ruta/Config/pacman/pacman.conf /etc/pacman.conf

# Aumentando repositorios de BlackArch 

curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Actualizando el sistema

sudo pacman -Syu --noconfirm

#Mejorando nuestro mirrorlist

sudo pacman -S --noconfirm reflector
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Instalando dependencias de Entorno
sudo pacman -S --noconfirm zsh wmname acpi bspwm kitty picom wget base-devel git vim xcb-util-keysyms xcb-util-wm xcb-util-xrm alsa-lib xcb-util-cursor xorg-xdpyinfo polybar zsh-autosuggestions firefox ninja make

# Instalando Requerimientos para la polybar
sudo pacman -S --noconfirm cmake gcc pkg-config python-sphinx cairo xcb-util-image xcb-util-wm xcb-util-cursor xcb-util-renderutil xcb-util-errors libpulse jsoncpp libmpdclient libnl libuv

# Dependencias de Picom
sudo pacman -S --noconfirm neovim meson libxext libxcb libxdamage libxfixes libxshmfence pixman dbus libconfig libgl pcre uthash libev libx11 libxcb xorg-server xorg-xinit xterm xorg-xprop librsvg gdk-pixbuf2

# Instalando paquetes adicionales
sudo pacman -S --noconfirm feh scrot xclip bat locate sxhkd ranger lightdm lightdm-gtk-greeter net-tools python3 imagemagick libheif libid3tag fastfetch docker

#Instalando herramientas de pentesting

sudo pacman -S --noconfirm nmap exploitdb hydra john openvpn burpsuite gobuster wfuzz tcpdump hashcat sqlmap snort 

#Instalando yay
cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Creando carpeta de Reposistorios

mkdir -p ~/github

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

mkdir -p ~/Wallpaper
cp -v $ruta/Wallpaper/* ~/Wallpaper

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

sudo mkdir -p /usr/local/share/fonts/ /usr/share/fonts/truetype/ /usr/share/zsh/plugins/zsh-sudo/
cd /usr/share/zsh/plugins/zsh-sudo/
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

cd /usr/share/zsh/plugins/
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

#Detectamos la resolucion del monitor y lo adaptamos 

sudo cp -v $ruta/Config/resolution/* /etc/X11/xorg.conf.d/

#Instalando Nvim

git clone https://github.com/NvChad/starter ~/.config/nvim

#Instalando Wordlists

cd /usr/share/ 
sudo git clone --depth 1 https://github.com/danielmiessler/SecLists.git



# Agregar configuración de teclado



# Removiendo Repositorio

cd ~/
sudo rm -r ~/github
sudo rm -r ~/Script-Arch

# Mensaje de Instalado

if command -v notify-send &>/dev/null; then
    notify-send "BSPWM INSTALADO"
else
    echo "BSPWM INSTALADO"
fi
