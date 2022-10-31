local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.indigo
theme.primary.hue_500 = '#FF0000'
-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.blue_grey

theme.background.hue_800 = '#241d1d'
theme.background.hue_900 = '#9b0b0b'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
