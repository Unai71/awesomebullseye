local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),
  awful.key(
    {modkey},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  ),
  awful.key({ modkey,           }, "n",
       function (c)
           -- The client currently has the input focus, so it cannot be
           -- minimized, since minimized clients can't have the focus.
           c.minimized = true
       end ,
       {description = "minimize", group = "client"}),
   awful.key({ modkey,           }, "m",
       function (c)
           c.maximized = true
           c:raise()
       end ,
       {description = "(un)maximize", group = "client"}),
   awful.key({ modkey, "Control" }, "m",
       function (c)
           c.maximized_vertical = not c.maximized_vertical
           c:raise()
       end ,
       {description = "(un)maximize vertically", group = "client"})
)

return clientKeys
