return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
      diagnostics = "nvim_lsp", -- ✅ enable diagnostics

      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or "")
          s = s .. sym .. n .. " "
        end
        return s
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true
        }
      },
    },
  },
}
