return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local bg = "#011628"
		local bg_dark = "#011423"
		local bg_highlight = "#143652"
		local bg_search = "#0a64ac"
		local bg_visual = "#275378"
		local fg = "#cbe0f0"
		local fg_dark = "#b4d0e9"
		local fg_gutter = "#627e97"
		local border = "#547998"

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "tokyonight",
			callback = function()
				-- Customize Type and Typedef highlight grou  if ()
				vim.api.nvim_set_hl(0, "@type", { fg = "#85de93" }) -- Tomato for tfunctionypedefs
				vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#3691ff" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@function", { fg = "#dbcc58" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#dbcc58" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@string", { fg = "#e35734" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "PreProc", { fg = "#bb9af7" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@variable", { fg = "#7dcfff" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@keyword", { fg = "#bb9af7" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@operator", { fg = "#ffffff" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#ffffff" }) -- Tomato for typedefs
				vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff" }) -- Tomato for typedefs vim.api.nvim_set_hl(0, "@punctuation.braces", { fg =  "#8725db" }) -- Tomato for typedefs
				-- vim.api.nvim_set_hl(0, "@punctuation.braces", { fg = "#18f535" }) -- Tomato for typedefs vim.api.nvim_set_hl(0, "@punctuation.braces", { fg =  "#8725db" }) -- Tomato for typedefs
			end,
		})
		require("tokyonight").setup({
			style = "night",
			on_colors = function(colors)
				colors.bg = bg
				colors.bg_dark = bg_dark
				colors.bg_float = bg_dark
				colors.bg_highlight = bg_highlight
				colors.bg_popup = bg_dark
				colors.bg_search = bg_search
				colors.bg_sidebar = bg_dark
				colors.bg_statusline = bg_dark
				colors.bg_visual = bg_visual
				colors.border = border
				colors.fg = fg
				colors.fg_dark = fg_dark
				colors.fg_float = fg
				colors.fg_gutter = fg_gutter
				colors.fg_sidebar = fg_dark -- Customizing Type and TypeDef
			end,
		})
		vim.cmd("colorscheme tokyonight") -- Apply custom highlight groups for types and parameters
	end,
}
