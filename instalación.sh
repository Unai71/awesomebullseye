#!bin/sh

#Actualización y dependencias 
apt install awesome fonts-roboto rofi xclip qt5-style-plugins materia-gtk-theme lxappearance brightnessctl flameshot thunar xfce4-power-manager pnmixer network-manager-gnome policykit-1-gnome nitrogen libxrandr-dev libpam0g-dev -y
wget -qO- https://git.io/papirus-icon-theme-install | sh

#alsa sound rehab
rm /etc/modprobe.d/alsa-base
touch /etc/modprobe.d/alsa-base

#repositorio
git clone [url] ~/.config/awesome/

#Instalación de las AppImage y WebApps
touch ~/.local/share/applications/Whatsapp.desktop
touch ~/.local/share/applications/Telegram.desktop
echo "[Desktop Entry] \nName=Whatsapp Web\nType=Application\nComment=Phone driven messenger\nGenericName=whatsapp\nExec=chromium --app=https://web.whatsapp.com\nIcon=whatsapp\nTerminal=false\nCategories=Social,Network" > ~/.local/share/applications/Whatsapp.desktop
echo "[Desktop Entry]\nName=Telegram Desktop\nType=Application\nComment=Instant messenger\nGenericName=Messenger\nExec=/home/unai/.local/lib/Telegram/Telegram\nIcon=telegram-desktop\nTerminal=false\nCategories=Social,Network\n" > ~/.local/share/applications/Telegram.desktop
wget https://telegram.org/dl/desktop/linux -O tsetup.tar.xz
tar xvf tsetup.tar.xz 
mv Telegram ~/.local/lib/
rm tsetup.tar.xz

