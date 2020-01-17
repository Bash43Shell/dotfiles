local theme_assets				= require("beautiful.theme_assets")
local dpi						= require("beautiful.xresources").apply_dpi
local gfs						= require("gears.filesystem")
local themes_path				= gfs.get_themes_dir()
local gears_shape				= require("gears.shape")
local wibox						= require("wibox")
local awful_widget_clienticon	= require("awful.widget.clienticon")
local gtk						= require("beautiful.gtk")


local hex_color_match = "[a-fA-F0-9][a-fA-F0-9]"
local function darker(color_value, darker_n)
	local result = "#"
	local channel_counter = 1
	for s in color_value:gmatch(hex_color_match) do
		local bg_numeric_value = tonumber("0x"..s)
		if channel_counter <= 3 then
			bg_numeric_value = bg_numeric_value - darker_n
		end
		if bg_numeric_value < 0 then bg_numeric_value = 0 end
		if bg_numeric_value > 255 then bg_numeric_value = 255 end
		result = result .. string.format("%02x", bg_numeric_value)
		channel_counter = channel_counter + 1
	end
	return result
end
local function is_dark(color_value)
	local bg_numeric_value = 0;
	local channel_counter = 1
	for s in color_value:gmatch(hex_color_match) do
		bg_numeric_value = bg_numeric_value + tonumber("0x"..s);
		if channel_counter == 3 then
			break
		end
		channel_counter = channel_counter + 1
	end
	local is_dark_bg = (bg_numeric_value < 383)
	return is_dark_bg
end
local function mix(color1, color2, ratio)
	ratio = ratio or 0.5
	local result = "#"
	local channels1 = color1:gmatch(hex_color_match)
	local channels2 = color2:gmatch(hex_color_match)
	for _ = 1,3 do
		local bg_numeric_value = math.ceil(
		tonumber("0x"..channels1())*ratio +
		tonumber("0x"..channels2())*(1-ratio)
		)
		if bg_numeric_value < 0 then bg_numeric_value = 0 end
		if bg_numeric_value > 255 then bg_numeric_value = 255 end
		result = result .. string.format("%02x", bg_numeric_value)
	end
	return result
end
local function reduce_contrast(color, ratio)
	ratio = ratio or 50
	return darker(color, is_dark(color) and -ratio or ratio)
end

local function choose_contrast_color(reference, candidate1, candidate2)  -- luacheck: no unused
	if is_dark(reference) then
		if not is_dark(candidate1) then
			return candidate1
		else
			return candidate2
		end
	else
		if is_dark(candidate1) then
			return candidate1
		else
			return candidate2
		end
	end
end


local theme = dofile(themes_path.."xresources/theme.lua")

theme.gtk = gtk.get_theme_variables()
if not theme.gtk then
	local gears_debug = require("gears.debug")
	gears_debug.print_warning("Can't load GTK+3 theme. Using 'xresources' theme as a fallback.")
	return theme
end

theme.gtk.button_border_radius	= dpi(theme.gtk.button_border_radius or 0)
theme.gtk.button_border_width	= dpi(theme.gtk.button_border_width or 1)
theme.gtk.menubar_border_color	= mix(
	theme.gtk.menubar_bg_color,
	theme.gtk.menubar_fg_color,
	0.75
)


theme.font			= theme.gtk.font_family .. ' ' .. theme.gtk.font_size
theme.gtk.bold_font = theme.gtk.font_family .. ' Bold ' .. theme.gtk.font_size

theme.wibar_bg		= theme.gtk.menubar_bg_color
theme.wibar_fg		= theme.gtk.menubar_fg_color

theme.bg_normal		= theme.gtk.bg_color
theme.bg_focus		= theme.gtk.selected_bg_color
theme.bg_urgent		= theme.gtk.error_bg_color
theme.bg_minimize	= mix(theme.wibar_fg, theme.wibar_bg, 0.3)
theme.bg_systray	= theme.wibar_bg

theme.fg_normal		= theme.gtk.fg_color
theme.fg_focus		= theme.gtk.selected_fg_color
theme.fg_urgent		= theme.gtk.error_fg_color
theme.fg_minimize	= mix(theme.wibar_fg, theme.wibar_bg, 0.9)

theme.border_normal	= theme.gtk.wm_border_unfocused_color
theme.border_focus	= theme.gtk.wm_border_focused_color
theme.border_marked	= theme.gtk.success_color

theme.border_width	= dpi(theme.gtk.button_border_width or 1)
theme.border_radius	= theme.gtk.button_border_radius

theme.useless_gap	= dpi(5)

theme.tasklist_bg_normal	= theme.wibar_bg
theme.tasklist_bg_focus		= theme.tasklist_bg_normal
theme.tasklist_fg_normal	= theme.wibar_fg
theme.tasklist_fg_focus		= theme.tasklist_fg_normal


local daftar_tugas = function(cr, w, h)
	gears_shape.rectangle(cr, w, h)
end
-- theme.tasklist_font_focus = theme.gtk.bold_font
theme.tasklist_shape_minimized				= daftar_tugas
-- theme.tasklist_shape_border_color_minimized	= daftar_tugas
-- theme.tasklist_shape_border_width_minimized	= theme.gtk.button_border_width
theme.tasklist_spacing						= theme.gtk.button_border_width

theme.tasklist_widget_template = {
	{
		{
			{
				{
					id     = 'clienticon',
					widget = awful_widget_clienticon,
				},
				margins = dpi(4),
				widget  = wibox.container.margin,
			},
			{
				id     = 'text_role',
				widget = wibox.widget.textbox,
			},
			layout = wibox.layout.fixed.horizontal,
		},
		left  = dpi(10),
		right = dpi(10),
		widget = wibox.container.margin
	},
	id     = 'background_role',
	widget = wibox.container.background,
	create_callback = function(self, c)
		self:get_children_by_id('clienticon')[1].client = c
	end,
}

theme.taglist_shape_container				= rounded_rect_shape
theme.taglist_shape_clip_container			= true
theme.taglist_shape_border_width_container	= theme.gtk.button_border_width * 2
theme.taglist_shape_border_color_container	= theme.gtk.header_button_border_color

theme.taglist_bg_occupied = theme.gtk.header_button_bg_color
theme.taglist_fg_occupied = theme.gtk.header_button_fg_color

theme.taglist_bg_empty = mix(
	theme.gtk.menubar_bg_color,
	theme.gtk.header_button_bg_color,
	0.3
)
theme.taglist_fg_empty = mix(
	theme.gtk.menubar_bg_color,
	theme.gtk.header_button_fg_color
)

theme.titlebar_font_normal	= theme.gtk.bold_font
theme.titlebar_bg_normal	= theme.gtk.wm_border_unfocused_color
theme.titlebar_fg_normal	= theme.gtk.wm_title_unfocused_color

theme.titlebar_font_focus	= theme.gtk.bold_font
theme.titlebar_bg_focus		= theme.gtk.wm_border_focused_color
theme.titlebar_fg_focus		= theme.gtk.wm_title_focused_color

theme.tooltip_fg			= theme.gtk.tooltip_fg_color
theme.tooltip_bg			= theme.gtk.tooltip_bg_color

theme.menu_border_width		= theme.gtk.button_border_width
theme.menu_border_color		= theme.gtk.menubar_border_color
theme.menu_bg_normal		= theme.gtk.menubar_bg_color
theme.menu_fg_normal		= theme.gtk.menubar_fg_color

theme.menu_height			= dpi(24)
theme.menu_width			= dpi(120)
theme.menu_submenu_icon		= nil
theme.menu_submenu			= "▸ "

theme = theme_assets.recolor_layout(theme, theme.wibar_fg)

theme = theme_assets.recolor_titlebar(
	theme, theme.titlebar_fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
	theme, reduce_contrast(theme.titlebar_fg_normal, 50), "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
	theme, theme.gtk.error_bg_color, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
	theme, theme.titlebar_fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
	theme, reduce_contrast(theme.titlebar_fg_focus, 50), "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
	theme, theme.gtk.error_bg_color, "focus", "press"
)

theme.icon_theme = nil

theme.awesome_icon = theme_assets.awesome_icon(
	theme.menu_height, mix(theme.bg_focus, theme.fg_normal), theme.wibar_bg
)

theme.taglist_squares_sel	= nil
theme.taglist_squares_unsel	= nil

-- local wallpaper_bg				= theme.gtk.base_color
-- local wallpaper_fg				= theme.gtk.bg_color
-- local wallpaper_alt_fg			= theme.gtk.selected_bg_color
-- if not is_dark(theme.bg_normal) then
-- 	wallpaper_bg, wallpaper_fg	= wallpaper_fg, wallpaper_bg
-- end
-- 
-- wallpaper_bg = reduce_contrast(wallpaper_bg, 50)
-- wallpaper_fg = reduce_contrast(wallpaper_fg, 30)
-- wallpaper_fg = mix(wallpaper_fg, wallpaper_bg, 0.4)
-- wallpaper_alt_fg = mix(wallpaper_alt_fg, wallpaper_fg, 0.4)
-- theme.wallpaper = function(s)
-- 	return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
-- end

theme.wallpaper = "/home/jurigwifi/Pictures/Wallpaper/Arch_Linux.jpg"

return theme
