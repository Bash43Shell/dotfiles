local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local awful = require("awful")

if awesome.startup_errors then
	naughty.notify(
		{
			preset = naughty.config.presets.critical,
			title = "Peringatan: Kesalahan Pada Saat Memulai Awesome!",
			text = awesome.startup_errors
		}
	)
end

do
	local in_error = false
	awesome.connect_signal(
		"debug::error",
		function (err)
			naughty.notify(
				{
					preset = naughty.config.presets.critical,
					title = "Error Terdapat Kesalahan",
					text = tostring(err)
				}
			)
			in_error = false
		end
	)
end

beautiful.init("~/.config/awesome/tampilan/kerangka.lua")
-- beautiful.init("~/.config/awesome/tema/gtk/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "gtk/theme.lua")

awful.util.spawn("mpd")
awful.util.spawn("picom")
awful.util.spawn("nm-applet")
