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

# Instalando todas las paquetes del sistema host
packages=$(<installed_packages.txt)
sudo pacman -S --noconfirm $packages

# Rest of your script continues...

# Instalando yay
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

