local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

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
    browser = 'brave-browser',
    editor = 'atom', -- gui text editor
    social = 'telegram-desktop',
    game = rofi_command,
    files = 'thunar',
    music = 'spotify'
  },





  -- List of apps to start once on start-up
  run_on_start_up = {
    'tlp start',
--    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
   'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf --experimental-backends',
   'nm-applet --indicator', -- wifi
--    'pnmixer', -- shows an audiocontrol applet in systray when installed.
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

