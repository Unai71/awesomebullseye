Opción 1: Menu rofi de catppuccin

## Credits

- [Siduck](https://github.com/siduck) I take his rofi theme and convert it to catppuccin

## Usage

First you need to install a nerd font in the [nerdfonts page](https://www.nerdfonts.com/font-downloads)
the default font is JetBrainsMono Nerd Font, but you can install another and then edit the theme
to set it

The file you need to edit is `.config/rofi/config.rasi` and change JetBrainsMono Nerd Font
to your font.

Clone the repository:

```sh
git clone https://github.com/catppuccin/rofi ./.catppuccin-rofi
cd ./.catppuccin-rofi
```

Then create the appropiate folders:

```sh
mkdir -p ~/.config/rofi ~/.local/share/rofi/themes
```

Then copy the files:

```sh
cp -r ./.config/rofi/* ~/.config/rofi
cp -r ./.local/share/rofi/themes/* ~/.local/share/rofi/themes/
```

Then simply run `rofi -show drun`

## 💝 Thanks to

- [AlphaTechnolog](https://github.com/AlphaTechnolog)