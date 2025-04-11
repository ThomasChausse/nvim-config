return {
  {
    "folke/tokyonight.nvim",
    priority = 256,
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
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1024,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or latte, frappe, macchiato
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },

  {
    'navarasu/onedark.nvim',
    priority = 512,
    config = function()
      require("onedark").setup({
        style = "darker",
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = true,   -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })
      vim.cmd("colorscheme onedark")
    end

  }
}
