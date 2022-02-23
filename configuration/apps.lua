local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'rofi -show drun'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty',
    rofi = rofi_command,
    lock = 'slock',
    quake = 'kitty',
    screenshot = 'flameshot full -p ~/Imágenes/screenshots',
    region_screenshot = 'flameshot gui -p ~/Imágenes/screenshots',
    delayed_screenshot = 'flameshot full -p ~/Imágenes/screenshots -d 5000',
    browser = 'firefox',
    editor = 'codium', -- gui text editor
    social = 'telegram-desktop',
    game = rofi_command,
    files = 'nautilus',
    music = 'spotify'
  },





  -- List of apps to start once on start-up
  run_on_start_up = {
    'tlp start',
--    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
   'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf --experimental-backends',
   'nm-applet --indicator', -- wifi
  
    --'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
--     'flameshot',
    -- 'synology-drive -minimized',
     --'steam -silent',
    'nitrogen --restore',
    'blueman-applet', --iniciar bluetooth
    --'/usr/bin/variety',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'bluetooth off' --power off bluetooth at startup
  }
}

