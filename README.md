## Material and Mouse driven theme for [AwesomeWM 4.3](https://awesomewm.org/)
### Original design by ChrisTitus, This is a fork for my personal use

*Only tested on Thinkpad L15 g2, your mileage may vary*

*This is a fork of chris titus personal [awesome-setup](https://github.com/ChrisTitusTech/titus-awesome/tree/debian/widget)*



## Installation

### 1) Get all the dependencies

```
sudo apt install awesome fonts-roboto rofi xclip qt5-style-plugins materia-gtk-theme lxappearance brightnessctl scrot thunar xfce4-power-manager pnmixer network-manager-gnome policykit-1-gnome nitrogen libxrandr-dev libpam0g-dev ninja-build meson -y
wget -qO- https://git.io/papirus-icon-theme-install | sh
```
for arch: 
```
sudo pacman -S awesome rofi xclip qt5-style-plugins lxappearance brightnessctl scrot pnmixer thunar nitrogen tlp tlpui vscodium numlockx
```

#### Program list

- [AwesomeWM](https://awesomewm.org/) as the window manager - universal package install: awesome
- [Roboto](https://fonts.google.com/specimen/Roboto) as the **font** - Debian: fonts-roboto Arch: ttf-roboto
- [Rofi](https://github.com/DaveDavenport/rofi) for the app launcher - universal install: rofi
- [picom](https://github.com/jonaburg/picom) for the compositor (blur and animations) universal install: picom
  - *Note: I highly recommend using jonaburg's picom fork for debian users* 
- [slock](https://github.com/aario/slock-blur) the lockscreen application
- [xclip](https://github.com/astrand/xclip) for copying screenshots to clipboard package: xclip
- [gnome-polkit] recommend using the gnome-polkit as it integrates nicely for elevating programs that need root access
- [Materia](https://github.com/nana-4/materia-theme) as GTK theme - Arch Install: materia-theme debian: materia-gtk-theme
- [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) as icon theme Universal Install: wget -qO- https://git.io/papirus-icon-theme-install | sh
- [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) to set up the gtk and icon theme
- (Laptop) [brightnessctl]() for adjusting brightness on laptops (disabled by default)
- [flameshot](https://flameshot.js.org/#/) screenshot utility, can be replaced by whichever you want, just remember to edit the configuration/apps.lua file
- [pnmixer](https://github.com/nicklan/pnmixer) Audio Tray icon that is in debian repositories and is easily installed on arch through AUR.
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet) nm-applet is a Network Manager Tray display from GNOME.
- [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/start) XFCE4's power manager is excellent and a great way of dealing with sleep, monitor timeout, and other power management features.
- firefox or brave as a browser (Para usar la ultima version de firefox usar esta [guía](./Como instalar firefox como aplicación.md)
- [nvim](https://github.com/neovim/neovim/wiki/Building-Neovim)
- [vscodium](https://github.com/VSCodium/vscodium/releases)

*nota:* para tener freakin sonido:

``sudo nvim /etc/modprobe.d/alsa-base`` y borrar todo

### 2) Clone the configuration

### Debian-Based Installs

```
git clone  https://github.com/Unai71/awesomebullseye.git ~/.config/awesome/
```

### 3) Install picom

Start by cloning jonaburg's picom-fork from github, then get into the directory and build the code and install

```bash
  git clone https://github.com/jonaburg/picom.git 
  cd picom
  meson --buildtype=release . build
  sudo ninja -C build install
```

You may have to install ninja and meson  `sudo apt install meson ninja-build -y`

### 4) Set the themes

Start `lxappearance` to active the **icon** theme and **GTK** theme
Note: for cursor theme, edit `~/.icons/default/index.theme` and `~/.config/gtk3-0/settings.ini`, for the change to also show up in applications run as root, copy the 2 files over to their respective place in `/root`.

Recommended Cursors - <https://github.com/keeferrourke/capitaine-cursors>

Set Rofi Theme
```
mkdir -p ~/.config/rofi
cp $HOME/.config/awesome/theme/config.rasi ~/.config/rofi/config.rasi
sed -i '/@import/c\@import "'$HOME'/.config/awesome/theme/spotlight.rasi"' ~/.config/rofi/config.rasi
```

### 5) Same theme for Qt/KDE applications and GTK applications, and fix missing indicators

First install `qt5-style-plugins` (debian) | `qt5-styleplugins` (arch) and add this to the bottom of your `/etc/environment`

```bash
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
```

The first variable fixes most indicators (especially electron based ones!), the second tells Qt and KDE applications to use your gtk2 theme set through lxappearance.

### 6) Read the documentation

The documentation live within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additional information about the them.

* [Configuration](./configuration) is about all the **settings** available
* [Layout](./layout) hold the **disposition** of all the widgets
* [Module](./module) contain all the **features** available
* [Theme](./theme) hold all the **aesthetic** aspects
* [Widget](./widget) contain all the **widgets** available
