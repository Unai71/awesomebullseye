## Configuration

Here you will find all the settings available.

#### Apps.lua

In the `apps.lua` file you can set your default apps for such things as the terminal, lock agent, file explorer...

![Ejemplo defaults](/home/unai/.config/Typora/typora-user-images/image-20210803183341799.png)

*be sure you add these name variables later in the layout/client subfolder*

Here also lies the run-on-startup commands or apps you wish to setup

For further configuration pls read the [documentation](https://awesomewm.org/doc/api/)

#### Compositor config files
These are the config files for compton and picom, these setup is what suits best my current laptop-desktop combo, again, your mileage may vary.

#### init.lua
Just a referencing bridge between the main `rc.lua` and the `keys` and `apps` lua files.
#### rofi.rasi 
The rofi config file, copy it to the rofi subfolder following the guide in the main [readme.md](../README.md)
