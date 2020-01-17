local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")


globalkeys = gears.table.join(
	awful.key({ modkey, }, "F1",
		hotkeys_popup.show_help,
		{
			description="show help", group="awesome"
		}
	),
	awful.key({	modkey, "Shift"	}, "End",
		awful.tag.viewprev,
		{
			description = "view previous", group = "tag"
		}
	),
	awful.key({ modkey, }, "End",
		awful.tag.viewnext,
		{
			description = "view next", group = "tag"
		}
	),
	awful.key({ modkey, }, "`",
		awful.tag.history.restore,
		{
			description = "go back", group = "tag"
		}
	),

	awful.key({ modkey, }, "w",
		function ()
			mymainmenu:show() end,
			{
				description = "show main menu", group = "awesome"
			}
	),



	awful.key({ modkey, }, "Right",
		function ()
			awful.client.focus.byidx( 1)
		end,
		{
			description = "focus next by index", group = "client"
		}
	),
	awful.key({	modkey,	}, "Left",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{
			description = "focus previous by index", group = "client"
		}
	),


	awful.key({ modkey, "Shift" }, "Right",
		function ()
			awful.client.swap.byidx(  1)
		end,
		{
			description = "swap with next client by index", group = "client"
		}
	),
	awful.key({	modkey,	"Shift"	}, "Left",
		function ()
			awful.client.swap.byidx( -1)
		end,
		{
			description = "swap with previous client by index", group = "client"
		}
	),



	awful.key({ modkey,	"Control" }, "j",
		function ()
			awful.screen.focus_relative( 1)
		end,
		{
			description = "focus the next screen", group = "screen"
		}
	),
	awful.key({ modkey,	"Control" }, "k",
		function ()
			awful.screen.focus_relative(-1)
		end,
		{
			description = "focus the previous screen", group = "screen"
		}
	),



	awful.key({ modkey, }, "u",
		awful.client.urgent.jumpto,
		{
			description = "jump to urgent client", group = "client"
		}
	),

	awful.key({	modkey, }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{
			description = "go back", group = "client"
		}
	),



	awful.key({	modkey,	}, "Return",
		function ()
			awful.spawn(terminal,
				{
					floating	= true,
					tag			= mouse.screen.selected_tag
				}
			)
		end,
		{
			description = "Buka Terminal", group = "launcher"
		}
	),

	awful.key({ modkey, }, "#22",
		awesome.restart,
		{
			description = "Muat Ulang Awesome", group = "awesome"
		}
	),

	awful.key({	modkey,	"Control" }, "Delete",
		awesome.quit,
		{
			description = "Keluar Awesome", group = "awesome"
		}
	),

	awful.key({	modkey, }, "l",
		function ()
			awful.tag.incmwfact( 0.05)
		end,
		{
			description = "increase master width factor", group = "layout"
		}
	),

	awful.key({	modkey, "Shift" }, "l",
		function ()
			awful.tag.incmwfact(-0.05)
		end,
		{
			description = "decrease master width factor", group = "layout"
		}
	),

	awful.key({	modkey, "Shift" }, "h",
		function ()
			awful.tag.incnmaster( 1, nil, true)
		end,
		{
			description = "increase the number of master clients", group = "layout"
		}
	),

	awful.key({	modkey,	"Shift"	}, "l",
		function ()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{
			description = "decrease the number of master clients", group = "layout"
		}
	),

	awful.key({	modkey,	"Control" }, "h",
		function ()
			awful.tag.incncol( 1, nil, true)
		end,
		{
			description = "increase the number of columns", group = "layout"
		}
	),

	awful.key({	modkey,	"Control" }, "l",
		function ()
			awful.tag.incncol(-1, nil, true)
		end,
		{
			description = "decrease the number of columns", group = "layout"
		}
	),

	awful.key({ modkey, "Control" }, "space",
		function ()
			awful.layout.inc( 1)
		end,
		{
			description = "select next", group = "layout"
		}
	),


	awful.key({ modkey,	"Shift" }, "space",
		function ()
			awful.layout.inc(-1)
		end,
		{
			description = "select previous", group = "layout"
		}
	),

	awful.key({ modkey, "Control" }, "n",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", {raise = true}
				)
			end
		end,
		{
			description = "restore minimized", group = "client"
		}
	),

	-- Prompt
	awful.key({ modkey, "Shift" }, "r",
		function ()
			awful.screen.focused().mypromptbox:run()
		end,
		{
			description = "Menjalankan Perintah Cepat", group = "launcher"
		}
	),

	awful.key({ modkey }, "x",
		function ()
			awful.prompt.run {
				prompt = "Run Lua code: ",
				textbox = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			}
		end,
		{
			description = "lua execute prompt", group = "awesome"
		}
	),

	-- Menubar
	awful.key({ modkey, }, "r",
		function()
			menubar.show()
		end,
		{
			description = "Menampilkan Menubar", group = "launcher"
		}
	),



	awful.key({	}, "XF86AudioRaiseVolume",
		function ()
			awful.util.spawn("pactl set-sink-volume 0 +5%")
		end,
		{
			description = "Volume Naik 5", group = "Sistem"
		}
	),
	awful.key({	}, "XF86AudioLowerVolume",
		function ()
			awful.util.spawn("pactl set-sink-volume 0 -5%")
		end,
		{
			description = "Volume Turun 5", group = "Sistem"
		}
	),
	awful.key({	}, "XF86AudioMute",
		function ()
			awful.util.spawn("pactl set-sink-mute 0 toggle")
		end,
		{
			description = "Volume Senyap", group = "Sistem"
		}
	),
	awful.key({	}, "XF86MonBrightnessUp",
		function ()
			awful.util.spawn("xbacklight -inc 5%")
		end,
		{
			description = "Kecerahan Naik 5", group = "Sistem"
		}
	),
	awful.key({	}, "XF86MonBrightnessDown",
		function ()
			awful.util.spawn("xbacklight -dec 5%")
		end,
		{
			description = "Kecerahan Turun 5", group = "Sistem"
		}
	),
	awful.key({	modkey, "Control" }, "l",
		function ()
			awful.spawn("pactl load-module module-loopback latency_msec=1")
		end,
		{
			description = "Mic Hidup", group = "Sistem"
		}
	),
	awful.key({	modkey, "Shift" }, "l",
		function ()
			awful.spawn("pactl unload-module module-loopback")
		end,
		{
			description = "Mic Mati", group = "Sistem"
		}
	),
	awful.key({	modkey, "Control" }, "v",
		function ()
			awful.spawn("glava -d -m graph")
		end,
		{
			description = "Desktop Audio Visualisasi", group = "Sistem"
		}
	),
	awful.key({	modkey, "Shift" }, "v",
		function ()
			awful.spawn("killall glava")
		end,
		{
			description = "Desktop Audio Visualisasi Hilangkan", group = "Sistem"
		}
	),


	awful.key({	modkey,	}, "m",
		function ()
			awful.spawn("urxvt -e ncmpcpp",
				{
					floating = true
				}
			)
		end,
		{
			description = "MPD Tatap Muka", group = "Media Musik"
		}
	),
	awful.key({	modkey,	}, "=",
		function ()
			awful.spawn("mpc -p 6600 next")
		end,
		{
			description = "Musik Selanjutnya", group = "Media Musik"
		}
	),
	awful.key({	modkey,	}, "-",
		function ()
			awful.spawn("mpc -p 6600 prev")
		end,
		{
			description = "Musik Sebelumnya", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Control" }, "m",
		function ()
			awful.spawn("mpc -p 6600 toggle")
		end,
		{
			description = "Musik Jeda", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Control", "Shift" }, "m",
		function ()
			awful.spawn("mpc -p 6600 stop")
		end,
		{
			description = "Musik Berhenti", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Shift" }, "=",
		function ()
			awful.spawn("mpc -p 6600 seek +00:00:05")
		end,
		{
			description = "Musik Maju 5 Detik", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Shift" }, "-",
		function ()
			awful.spawn("mpc -p 6600 seek -00:00:05")
		end,
		{
			description = "Musik Mundur 5 Detik", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Control" }, "=",
		function ()
			awful.spawn("mpc -p 6600 volume +5")
		end,
		{
			description = "MPD Volume Naik 5", group = "Media Musik"
		}
	),
	awful.key({	modkey,	"Control" }, "-",
		function ()
			awful.spawn("mpc -p 6600 volume Turun 5")
		end,
		{
			description = "MPD Volume -5", group = "Media Musik"
		}
	),
	awful.key({	modkey, }, "v",
		function ()
			awful.spawn("urxvt -e ncmpcpp -s visualizer")
		end,
		{
			description = "MPD Visualisasi", group = "Media Musik"
		}
	),
	awful.key({	modkey, }, "l",
		function ()
			awful.spawn("urxvt -e ncmpcpp -s lyrics")
		end,
		{
			description = "MPD Lirik", group = "Media Musik"
		}
	),


	awful.key({	modkey,	}, "e",
		function ()
			awful.spawn("thunar")
		end,
		{
			description = "Thunar", group = "Berkas"
		}
	),
	awful.key({	modkey,	"Shift" }, "e",
		function ()
			awful.spawn("nautilus")
		end,
		{
			description = "Nautilus", group = "Berkas"
		}
	),

	awful.key({	modkey,	}, "b",
		function ()
			awful.spawn("firefox")
		end,
		{
			description = "Firefox", group = "Internet"
		}
	),
	awful.key({	modkey, "Shift" }, "b",
		function ()
			awful.spawn("chromium")
		end,
		{
			description = "Chromium", group = "Internet"
		}
	),
	awful.key({	modkey, }, "#127",
		function ()
			awful.spawn("aria2c --enable-rpc --rpc-listen-all")
		end,
		{
			description = "Jalankan Aria2 Di Latar", group = "Internet"
		}
	),
	awful.key({	modkey, "Shift" }, "#127",
		function ()
			awful.spawn("killall aria2c")
		end,
		{
			description = "Aria2 Hilangkan", group = "Internet"
		}
	),



	awful.key({	modkey, "Control", "Shift" }, "Print",
		function ()
			awful.spawn("xfce4-screenshooter")
		end,
		{
			description = "Tangkap Layar Dengan Aturan", group = "Alat"
		}
	),
	awful.key({ }, "Print",
		function ()
			awful.spawn("scrot -q 100 ~/Pictures/Screenshot/%Y-%m-%d_Screenshot_%H-%M-%S.png")
		end,
		{
			description = "Tangkap Layar Spontan", group = "Alat"
		}
	),
	awful.key({ modkey, }, "Print",
		function ()
			awful.spawn("scrot -q 100 ~/Pictures/Screenshot/%Y-%m-%d_Screenshot_%H-%M-%S.png")
		end,
		{
			description = "Tangkap Jendela Sepontan", group = "Alat"
		}
	),
	awful.key({ modkey, "Shift" }, "Print",
		function ()
			awful.spawn("eog ~/Pictures/Screenshot/$n")
		end,
		{
			description = "Lihat Hasil Tangkap Terakhir", group = "Alat"
		}
	),
	awful.key({ modkey, }, "Insert",
		function ()
			awful.spawn("x0vncserver -display :0 -passwordfile ~/.vnc/passwd")
		end,
		{
			description = "Remote Desktop", group = "Alat"
		}
	),
	awful.key({ modkey, "Shift" }, "Insert",
		function ()
			awful.spawn("killall x0vncserver")
		end,
		{
			description = "Remote Desktop Hilangkan", group = "Alat"
		}
	),
	awful.key({ modkey, }, "a",
		function ()
			awful.spawn("scrcpy -m 1280")
		end,
		{
			description = "Remote Android", group = "Alat"
		}
	),
	awful.key({ modkey, "Control", "Shift" }, "a",
		function ()
			awful.spawn("scrcpy -Nr ~/Videos/Android.mkv")
		end,
		{
			description = "Tangkap Layar Android", group = "Alat"
		}
	),
	awful.key({ modkey, "Shift" }, "a",
		function ()
			awful.spawn("killall scrcpy")
		end,
		{
			description = "Remote Android Hilangkan", group = "Alat"
		}
	),
	awful.key({ modkey, }, "k",
		function ()
			awful.spawn("screenkey")
		end,
		{
			description = "Tampilkan Kunci Keyboard", group = "Alat"
		}
	),
	awful.key({ modkey, "Shift" }, "k",
		function ()
			awful.spawn("killall screenkey")
		end,
		{
			description = "Tampilkan Kunci Keyboard Hilangkan", group = "Alat"
		}
	),

	awful.key({ modkey, }, "t",
		function ()
			awful.spawn.with_shell("xclip -o > ~/.Translate && trans -b :id -i ~/.Translate -o ~/.Terjemahan && urxvt -e less ~/.Terjemahan")
		end,
		{
			description = "Terjemahkan", group = "Alat"
		}
	),
	awful.key({ modkey, "Control" }, "t",
		function ()
			awful.spawn.with_shell("xclip -o > ~/.Translate && trans -b :id -i ~/.Translate -p")
		end,
		{
			description = "Terjemahkan Dan Bacakan", group = "Alat"
		}
	),
	awful.key({ modkey, "Shift" }, "t",
		function ()
			awful.spawn("scrot -s -d 1 -o ~/.TranslateImage.png && gocr -i ~/.TranslateImage.png -o ~/.TranslateImage && trans -b :id -i ~/.TranslateImage -o ~/.Terjemahan && urxvt -e less ~/.Terjemahan")
		end,
		{
			description = "Terjemahkan Dari Hasil Tangkap", group = "Alat"
		}
	),
	awful.key({ modkey, "Control",  "Shift" }, "t",
		function ()
			awful.spawn("scrot -s -d 1 -o ~/.TranslateImage.png && gocr -i ~/.TranslateImage.png -o ~/.TranslateImage && trans -b :id -i ~/.TranslateImage -p")
		end,
		{
			description = "Terjemahkan Dari Hasil Tangkap Dan Bacakan", group = "Alat"
		}
	)
)



clientkeys = gears.table.join(
	awful.key({ modkey, }, "F11",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{
			description = "Toggle Fullscreen", group = "client"
		}
	),
	awful.key({ modkey, }, "q",
		function (c)
			c:kill()
		end,
		{
			description = "Close", group = "client"
		}
	),
	awful.key({ modkey, }, "space",
		awful.client.floating.toggle,
		{
			description = "toggle floating", group = "client"
		}
	),
	awful.key({ modkey, "Control" }, "Return",
		function (c)
			c:swap(awful.client.getmaster())
		end,
		{
			description = "move to master", group = "client"
		}
	),
	awful.key({ modkey, }, "o",
		function (c)
			c:move_to_screen()
		end,
		{
			description = "move to screen", group = "client"
		}
	),
	awful.key({ modkey, }, "p",
		function (c)
			c.ontop = not c.ontop
		end,
		{
			description = "toggle keep on top", group = "client"
		}
	),
	awful.key({ modkey, }, "h",
		function (c)
			c.minimized = true
		end,
		{
			description = "Minimize", group = "client"
		}
	),
	awful.key({ modkey, }, "f",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{
			description = "Toggle Maximize", group = "client"
		}
	),
	awful.key({ modkey, "Control" }, "f",
		function (c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{
			description = "Toggle Maximize Vertically", group = "client"
		}
	),
	awful.key({ modkey, "Shift" }, "f",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{
			description = "Toggle Maximize Horizontally", group = "client"
		}
	)
)


for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
		awful.key({ modkey }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{
				description = "Ruang "..i, group = "tag"
			}
		),
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{
				description = "Bersama Ruang " .. i, group = "tag"
			}
		),
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{
				description = "Jendela Ke Ruang "..i, group = "tag"
			}
		),
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{
				description = "Tandai Ruang Aktif " .. i, group = "tag"
			}
		)
	)
end

root.keys(globalkeys)
