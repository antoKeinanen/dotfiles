local prev = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '󰒮',
  widget = wibox.widget.textbox,
}

local skip = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  text = '󰒭',
  widget = wibox.widget.textbox,
}

local play = wibox.widget {
  align = 'center',
  font = beautiful.icofont,
  markup = '',
  widget = wibox.widget.textbox,
}

local playing = false

play:buttons(gears.table.join(
  awful.button({}, 1, function() awful.spawn("playerctl -p spotify play-pause")
  playing = not playing
  if playing then
    play:set_markup_silently("󰏤")
  else
    play:set_markup_silently("")
  end
end)))

skip:buttons(gears.table.join(
  awful.button({}, 1, function() awful.spawn("playerctl -p spotify next") end)))

prev:buttons(gears.table.join(
  awful.button({}, 1, function() awful.spawn("playerctl -p spotify previous") end)))

local position = wibox.widget {
  forced_height      = dpi(3),
  shape              = help.rrect(beautiful.br),
  color              = beautiful.pri,
  background_color   = beautiful.fg2..'4D',
  forced_width       = dpi(175),
  widget             = wibox.widget.progressbar,
}

local art = wibox.widget {
  image = beautiful.wall,
  resize = true,
  -- clip_shape = help.rrect(beautiful.br),
  opacity = 0.25,
  forced_height = dpi(120),
  forced_width = dpi(120),
  widget = wibox.widget.imagebox
}

local name = wibox.widget {
  markup = '<b>Nothing Playing</b>',
  align = 'center',
  valign = 'center',
  forced_height = dpi(15),
  widget = wibox.widget.textbox
}

local artist_name = wibox.widget {
  markup = 'None',
  align = 'center',
  valign = 'center',
  forced_height = dpi(20),
  widget = wibox.widget.textbox
}

local player = wibox.widget {
  {
    art,
    {
      {
        widget = wibox.widget.textbox,
      },
      bg = {
        type = "linear",
        from = { 0, 0},
        to = { 120, 0},
        stops = { { 0, beautiful.bg2.."00" }, { 1, beautiful.bg2.."FF" } }
      },
      widget = wibox.container.background,
    },
    {
      {
        name,
        artist_name,
        position,
        {
          prev,
          play,
          skip,
          layout = wibox.layout.flex.horizontal,
        },
        spacing = dpi(5),
        layout = wibox.layout.fixed.vertical,
      },
      margins = dpi(20),
      widget = wibox.container.margin,
    },
    layout = wibox.layout.stack,
  },
  forced_height = dpi(120),
  shape = help.rrect(beautiful.br),
  bg = beautiful.bg2,
  widget = wibox.container.background,
}

function save_image_async_curl(url, filepath, callback)
  awful.spawn.with_line_callback(string.format("curl -L -s %s -o %s", url, filepath),
  {
    exit=callback
  })
end

local last_art_url = ""

awful.widget.watch("playerctl -p spotify metadata --format '{{title}}¦{{artist}}¦{{mpris:artUrl}}¦{{album}}¦{{position}}¦{{mpris:length}}'", 1, function(widget, stdout) 
  if stdout == "" or stdout == "No players found" then
    return
  end

  local tokens = {}
  for token in stdout:gmatch("[^%¦]+") do
    table.insert(tokens, token)
  end

  local title = tokens[1]
  local artist = tokens[2]
  local art_url = tokens[3]
  local album = tokens[4]
  local current_position = tonumber(tokens[5])
  local length = tonumber(tokens[6])

  if last_art_url ~= art_url then
    last_art_url = art_url
    save_image_async_curl(art_url, "/tmp/cover.png", function()
      art:set_image(gears.surface.load_uncached("/tmp/cover.png"))
      name:set_markup_silently(string.format("<b>%s</b>", title))
      artist_name:set_markup_silently(artist)

      naughty.notify({ 
        title = title,
        text = artist,
        icon = "/tmp/cover.png",
        icon_size = dpi(120),
        timeout = 5,
        hover_timeout = 0.5,
      })
    end)
  end

  position:set_value(current_position)
  position:set_max_value(length)
end)

awful.widget.watch("playerctl -p spotify metadata --format '{{status}}'", 1, function(widget, stdout) 
  if stdout == "" or stdout == "No players found" then
    return
  end

  if stdout == "Playing\n" then
    play:set_markup_silently("󰏤")
    playing = true
  else
    play:set_markup_silently("")
    playing = false
  end
end)

return player
