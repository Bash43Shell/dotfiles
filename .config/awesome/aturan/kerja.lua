local awful = require("awful")
local beautiful = require("beautiful")


awful.rules.rules = {
	{ rule = { },
		properties = {
-- 			border_width		= beautiful.border_width,
-- 			border_color		= beautiful.border_normal,
			buttons				= clientbuttons,
			focus				= awful.client.focus.filter,
			keys				= clientkeys,
			placement			= awful.placement.centered,
			raise				= true,
			screen				= awful.screen.preferred,
			size_hints_honor	= false,
			titlebars_enabled	= false
		}
	},

	{ rule_any = {
		instance = {
			"DTA",
			"copyq",
			"pinentry",
		},
		class = {
			"Arandr",
			"Gpick",
			"Gnome-system-monitor",
			"Modem-manager-gui",
			"4K Video Downloader",
			"Pavucontrol",
			"Write",
			"Thunderbird Preferences",
			"Instant messaging status",
			"Calendar",
			"Address Book",
			"Blender Render",
			"Blender Preferences",
			"Sign into Reddit",
			"Leafpad",
			"Network Connections",
			"PCSX2",
			"scrcpy",
			"File-roller"
		},
		name = {
			"Event Tester",
			"Diajar"
		},
		role = {
			"AlarmWindow",
			"ConfigManager",
			"pop-up"
		}
	}, properties =
		{
			floating = true
		}
	},

	{ rule_any = {
		class = {
			"Thunar",
			"Org.gnome.Nautilus"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"mpv"
		},
	}, properties =
		{
			maximized		= true,
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"firefox",
			"Chromium",
			"Opera"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"Atomic TweetDeck",
			"TelegramDesktop",
			"discord",
			"Thunderbird",
			"TweetDeck"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"Blender",
			"Inkscape",
			"Gimp"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"Gedit",
			"Org.gnome.gedit"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"libreoffice",
			"libreoffice-base",
			"libreoffice-calc",
			"libreoffice-draw",
			"libreoffice-impress",
			"libreoffice-math",
			"libreoffice-writer",
			"libreoffice-startcenter"
		},
		name = {
			"LibreOffice"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	},

	{ rule_any = {
		class = {
			"obs",
			"anbox",
			"Nm-connection-editor"
		},
	}, properties =
		{
			switch_to_tags	= "    ",
			tag				= "    "
		}
	}
}
