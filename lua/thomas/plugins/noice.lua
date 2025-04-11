return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = { event = "notify", find = "No information available" },
        opts = { skip = true },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
    -- Custom message settings
    messages = {
      enabled = true,
      timeout = 1000,
      view = "mini", -- Use nvim-notify for notifications
      view_error = "notify",
      view_warning = "mini",
    },
    -- Diagnostic configuration
    lsp = {
      progress = { enabled = false },  -- Optionally disable LSP progress messages
      signature = { enabled = false }, -- Disable signature help popups
    },
    -- Customize notifications
    notify = {
      level = "error",    -- Only show error-level notifications
      timeout = 3000,     -- Notification timeout duration
      render = "compact", -- Compact render for notifications
      view = "notify",
    },

    cmdline = {
      enable = true,
      view = "cmdline_popup"

    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
