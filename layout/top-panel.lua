local awful     = require('awful')
local beautiful = require('beautiful')
local wibox     = require('wibox')
local TaskList  = require('widget.task-list')
local TagList   = require('widget.tag-list')
local gears     = require('gears')
local lain      = require('lain')


local clickable_container = require('widget.material.clickable-container')
local mat_icon_button     = require('widget.material.icon-button')
local mat_icon            = require('widget.material.icon')
local dpi                 = require('beautiful').xresources.apply_dpi
local icons               = require('theme.icons')


local systray = wibox.widget.systray()
  systray:set_horizontal(true)
  systray:set_base_size(20)
  systray.forced_height = 20



  -- Clock / Calendar 24h format
local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%H:%M</span>')


local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/dremora"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10.5"
theme.taglist_font                              = "Icons 10"
theme.fg_normal                                 = "#747474"
theme.fg_focus                                  = "#DDDCFF"
theme.bg_normal                                 = "#121212"
theme.bg_focus                                  = "#121212"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(0)
theme.border_normal                             = "#121212"
theme.border_focus                              = "#292929"
theme.titlebar_bg_focus                         = "#292929"
theme.taglist_fg_focus                          = "#dddcff"
theme.taglist_bg_focus                          = "#121212"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(10)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

awful.util.tagnames   = { "ƀ", "Ƅ", "Ɗ", "ƈ", "ƙ" }

local markup     = lain.util.markup
local separators = lain.util.separators
local white      = theme.fg_focus
local gray       = "#858585"

-- Clock / Calendar 12AM/PM fornat
--local textclock = wibox.widget.textclock('<span font="Roboto Mono 12">%I:%M %p</span>')
-- textclock.forced_height = 36

--Nuevo textclock, basado en awesome-copycats
local mytextclock = wibox.widget.textclock(markup(white, "%d") .. markup(gray, "%b ") .. markup(white,"%H:%M "))
mytextclock.font = "Terminus 11"


--Nuevo calendario 
theme.cal = lain.widget.cal({
  attach_to = {mytextclock },
  notification_preset = {
    font = "Terminus 11",
    fg   = white,
    bg   = theme.bg_normal
  }
})


-- Add a calendar (credits to kylekewley for the original code)
--local month_calendar = awful.widget.calendar_popup.month({
--  screen = s,
 -- start_sunday = false,
 -- week_numbers = true
--})
--month_calendar:attach(textclock)

-- local clock_widget = wibox.container.margin(textclock, dpi(4), dpi(4), dpi(9), dpi(8))

--Bateria 
local bat = lain.widget.bat({
  settings = function()
    bat_header = "Bat "
    bat_p      = bat_now.perc .. " "
    widget:set_markup(markup.font(theme.font, markup(gray,bat_header) .. markup(white, bat_p)))
  end
})

--CPU
local cpu = lain.widget.cpu({
  settings = function()
    cpu_header = "CPU "
    cpu_usage =cpu_now.usage .. "% "
    widget:set_markup(markup.font(theme.font, markup(gray,cpu_header) .. markup(white, cpu_usage)))
  end
})
theme.volume = lain.widget.alsa({
  --togglechannel = "IEC958.3",
  settings = function()
    header = "Vol"
    vlevel = volume_now.level

    if volume_now.status == "off" then 
      vlevel = vlevel .. "M "
    else
      vlevel = vlevel .. " "
    end

    widget:set_markup(markup.font(theme.font, markup(gray,header) .. markup(white,vlevel)))
  end
})

-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
local LayoutBox = function(s)
  local layoutBox = clickable_container(awful.widget.layoutbox(s))
  layoutBox:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        3,
        function()
          awful.layout.inc(-1)
        end
      ),
      awful.button(
        {},
        4,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        5,
        function()
          awful.layout.inc(-1)
        end
      )
    )
  )
  return layoutBox
end

function spacer(width)
	return wibox.widget {
		forced_width = width,
		layout = wibox.layout.fixed.horizontal
	}
end


local TopPanel = function(s)
  
    local panel =
    wibox(
    {
      ontop = true,
      screen = s,
      height = dpi(32),
      width = s.geometry.width,
      x = s.geometry.x,
      y = s.geometry.y,
      stretch = false,
      bg = theme.background_normal,
      fg = white,
      struts = {
        top = dpi(32)
      }
    }
    )

    panel:struts(
      {
        top = dpi(32)
      }
    )

    panel:setup {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        -- Create a taglist widget
        TagList(s),
        TaskList(s),
        },
      nil,
      {
	
        layout = wibox.layout.fixed.horizontal,
        wibox.container.margin(systray, dpi(3), dpi(3), dpi(6), dpi(3)),
        -- Layout box
        --	volume_widget{widget_type = 'icon_and_text' , icon_dir = '~/.icons/'},
        spacer(10),
        theme.volume,
     	-- spacer(10),
       cpu,
      	bat,
        mytextclock,
	LayoutBox(s),
      }
    }

  return panel
end

return TopPanel
