-- You probably always want to set this in your vim file
vim.opt.background = "dark"
vim.g.colors_name = "code-minimal"

-- By setting our module to nil, we clear lua's cache,
-- which means the require ahead will *always* occur.
--
-- This isn't strictly required but it can be a useful trick if you are
-- incrementally editing your config a lot and want to be sure your themes
-- changes are being picked up without restarting neovim.
--
-- Note if you're working in on your theme and have :Lushify'd the buffer,
-- your changes will be applied with our without the following line.
--
-- The performance impact of this call can be measured in the hundreds of
-- *nanoseconds* and such could be considered "production safe".
package.loaded["lush_theme.code-minimal"] = nil

-- include our theme file and pass it to lush to apply
local lush = require("lush")
local codeminimal = require("lush_theme.code-minimal")

-- we can apply modifications ontop of the existing colorscheme
local spec = lush.extends({ codeminimal }).with(function()
	return {
		-- Use the existing Comment group in codeminimal, but adjust the gui attribute
		-- Comment({ fg = codeminimal.Comment.fg, bg = codeminimal.Comment.bg, gui = "italic" }),
		-- -- While we're here, we might decide that the default Function group is too bright
		-- Function({ fg = codeminimal.Function.fg.da(10) }),

		Normal({ fg = codeminimal.Normal.fg, bg = codeminimal.Normal.bg }),
	}
end)

-- then pass the extended spec to lush for application
lush(spec)
