local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local cpu_widget			= require("widget.cpu-widget.cpu-widget")
local ram_widget			= require("widget.ram-widget.ram-widget")
local volumearc_widget		= require("widget.volumearc-widget.volumearc")
local brightnessarc_widget	= require("widget.brightnessarc-widget.brightnessarc")
local batteryarc_widget		= require("widget.batteryarc-widget.batteryarc")
local mpdarc_widget			= require("widget.mpdarc-widget.mpdarc")


local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end), awful.button({ modkey }, 1,
		function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end
	),
	awful.button({ }, 3, awful.tag.viewtoggle), awful.button({ modkey }, 3,
		function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end
	),
	awful.button({ }, 4,
		function(t)
			awful.tag.viewnext(t.screen)
		end
	),
	awful.button({ }, 5,
		function(t)
			awful.tag.viewprev(t.screen)
		end
	)
)

local tasklist_buttons = gears.table.join(
	awful.button({ }, 1,
		function (c)
			if c == client.focus then
				c.minimized = true
			else
				c:emit_signal(
					"request::activate",
					"tasklist",
					{raise = true}
				)
			end
		end
	),
	awful.button({ }, 3,
		function()
			awful.menu.client_list({ theme = { width = 250 } })
		end
	),
	awful.button({ }, 4,
		function ()
			awful.client.focus.byidx(1)
		end
	),
	awful.button({ }, 5,
		function ()
			awful.client.focus.byidx(-1)
		end
	)
)

clientbuttons = gears.table.join(
	awful.button({ }, 1,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
		end
	),
	awful.button({ modkey }, 1,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.move(c)
		end
	),
	awful.button({ modkey }, 3,
		function (c)
			c:emit_signal("request::activate", "mouse_click", {raise = true})
			awful.mouse.client.resize(c)
		end
	)
)


awful.screen.connect_for_each_screen(
	function(s)
		awful.tag(
			{
				"    ",
				"    ",
				"    ",
				"    ",
				"    ",
				"    ",
				"    ",
				"    ",
				"    "
			}, s, awful.layout.layouts[1]
		)
		s.mypromptbox = awful.widget.prompt()
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mylayoutbox:buttons(
			gears.table.join(
				awful.button({ }, 1,
					function ()
						awful.layout.inc( 1)
					end
				),
				awful.button({ }, 3,
					function ()
						awful.layout.inc(-1)
					end
				),
				awful.button({ }, 4,
					function () 
						awful.layout.inc( 1)
					end
				),
				awful.button({ }, 5,
					function ()
						awful.layout.inc(-1)
					end
				)
			)
		)
		s.mytaglist = awful.widget.taglist {
			screen  = s,
			filter  = awful.widget.taglist.filter.all,
			buttons = taglist_buttons
		}

		s.mytasklist = awful.widget.tasklist {
			screen	= s,
			filter	= awful.widget.tasklist.filter.currenttags,
			buttons	= tasklist_buttons,
			style	= {
-- 				shape_border_width = 1,
-- 				shape_border_color = '#777777',
-- 				shape  = gears.shape.rectangular_tag,
			},
			layout   = {
				spacing = 1,
-- 				spacing_widget = {
-- 				{
-- 				forced_width = 5,
-- 				shape        = gears.shape.circle,
-- 				widget       = wibox.widget.separator
-- 				},
-- 				valign = 'center',
-- 				halign = 'center',
-- 				widget = wibox.container.place,
-- 				},
				layout  = wibox.layout.flex.horizontal
			},
			widget_template = {
				{
					{
						{
							{
								id     = 'icon_role',
								widget = wibox.widget.imagebox,
							},
							margins = 2,
							widget  = wibox.container.margin,
						},
						{
							id		= 'text_role',
							widget	= wibox.widget.textbox,
						},
						layout = wibox.layout.fixed.horizontal,
					},
					left  = 5,
					right = 5,
					widget = wibox.container.margin
				},
				id     = 'background_role',
				widget = wibox.container.background,
			},
		}

		s.mywibox = awful.wibar(
			{
				position = "top", screen = s
			}
		)
		s.mywibox:setup {
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
-- 				mylauncher,
				s.mytaglist,
-- 				separator,
-- 				s.mypromptbox,
			},
			separator,
-- 			s.mytasklist, -- Middle widget
			{
				layout = wibox.layout.fixed.horizontal,
				cpu_widget(),
				separator,
				ram_widget(),
				separator,
				mpdarc_widget,
				separator,
				brightnessarc_widget(),
				separator,
				volumearc_widget(),
				separator,
				batteryarc_widget(),
				separator,
				mytextclock,
				separator,
				wibox.widget.systray(),
-- 				separator,
-- 				s.mylayoutbox,
			}
		}
	end
)
