local awful			= require("awful")
local beautiful		= require("beautiful")
local menubar		= require("menubar")
local wibox			= require("wibox")
local hotkeys_popup		= require("awful.hotkeys_popup")
local calendar_widget	= require("widget.calendar-widget.calendar")


modkey					= "Mod4"
terminal				= "urxvt"
editor					= os.getenv("EDITOR") or "vim"
editor_cmd				= terminal .. " -e " .. editor
kunci					= "slimlock"
menubar.utils.terminal	= terminal
-- mykeyboardlayout		= awful.widget.keyboardlayout()
mytextclock				= wibox.widget.textclock()
local calendar			= calendar_widget()

mytextclock:connect_signal("button::press", 
	function(_, _, _, button)
		if button == 1 then calendar.toggle() end
	end)


separator = wibox.widget {
	widget = wibox.widget.separator,
-- 	orientation = "vertical",
	forced_width = 10,
	color = "#00000000",
	visible = true
}



awful.layout.layouts = {
	awful.layout.suit.fair,
	--awful.layout.suit.fair.horizontal,
	awful.layout.suit.floating,
	--awful.layout.suit.tile,
	--awful.layout.suit.tile.left,
	--awful.layout.suit.tile.bottom,
	--awful.layout.suit.tile.top,
	awful.layout.suit.max,
	--awful.layout.suit.max.fullscreen,
	awful.layout.suit.spiral,
	--awful.layout.suit.spiral.dwindle,
	--awful.layout.suit.magnifier,
	--awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}

myawesomemenu = {
	{
		"Panduan",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end 
	},
	--{
	--"Panduan",
	--terminal .. " -e man awesome"
	--},
	{
		"Konfigurasi",
		editor_cmd .. " " .. awesome.conffile
	},
	{
		"Penyegaran",
		awesome.restart
	},
	{
		"Keluar",
		function()
			awesome.quit()
		end
	},
}

mymainmenu = awful.menu(
	{
		items = {
			{ "Awesome", myawesomemenu, beautiful.awesome_icon },
			{ "Terminal", terminal },
			{ "Kunci", kunci }
		}
	}
)

mylauncher = awful.widget.launcher(
	{
		image = beautiful.awesome_icon,
		menu = mymainmenu
	}
)
