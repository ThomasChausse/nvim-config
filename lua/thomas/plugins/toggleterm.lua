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
        local cwd = vim.fn.expand("%:p:h")
        local height = 100
        local width = 150

        if cmd == "gh" then
          direction = "float"
          height    = 50
          width     = 150
        end

        term_id_counter = term_id_counter + 1
        terminals[cmd] = Terminal:new({
          open_mapping = [[<leader>mt]],
          dir = vim.fn.getcwd(),
          direction = direction,
          float_opts = {
            border = "curved",
            winblend = 0,
            height = height,
            width = width

          },
          on_open = function(term)
            -- Send the actual command to the shell after it opens
            vim.fn.chansend(term.job_id, "git status\n")
          end,
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
