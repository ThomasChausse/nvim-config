return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal", -- or 'horizontal', 'vertical', 'tab'
      open_mapping = [[<leader>mt]],
      float_opts = {
        border = "curved",
        winblend = 0,
        height = 75,

      },
      shade_terminals = false,
      start_in_insert = true,
    })
    -- 🔽 Paste the dynamic terminal logic below here:
    --
    local Terminal = require("toggleterm.terminal").Terminal
    local terminals = {}
    local term_id_counter = 10

    function _G.toggle_custom_term(cmd)
      if not terminals[cmd] then
        local direction = "horizontal"
        if cmd == "lazygit" then
          direction = "float"
        end
        term_id_counter = term_id_counter + 1
        terminals[cmd] = Terminal:new({
          open_mapping = [[<leader>mt]],
          direction = direction,
          float_opts = {
            border = "curved",
            winblend = 0,
            height = 75,

          },
          shade_terminals = false,
          start_in_insert = true,
        })
      end

      terminals[cmd]:toggle()
    end

    vim.keymap.set("n", "<leader>mtg", function()
      toggle_custom_term("gh") -- GitHub CLI
    end, { desc = "Toggle GitHub CLI terminal" })

    vim.keymap.set("n", "<leader>mtl", function()
      toggle_custom_term("lazygit") -- LazyGit
    end, { desc = "Toggle LazyGit terminal" })

    vim.keymap.set("n", "<leader>mtk", function()
      toggle_custom_term("make") -- Run build
    end, { desc = "Toggle Make Build terminal" })
  end,
}
