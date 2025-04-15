-- return {
--   "akinsho/toggleterm.nvim",
--   version = "*",
--   config = function()
--     require("toggleterm").setup({
--       direction = "horizontal", -- or 'horizontal', 'vertical', 'tab'
--       open_mapping = [[<leader>mt]],
--       float_opts = {
--         border = "curved",
--         winblend = 0,
--         height = 75,
--
--       },
--       shade_terminals = false,
--       start_in_insert = true,
--     })
--     -- 🔽 Paste the dynamic terminal logic below here:
--     --
--     local Terminal = require("toggleterm.terminal").Terminal
--     local terminals = {}
--     local term_id_counter = 10
--
--     function _G.toggle_custom_term(cmd)
--       if not terminals[cmd] then
--         local direction = "horizontal"
--         local cwd = vim.fn.expand("%:p:h")
--         local height = nil
--         local width = nil
--         local size = nil
--
--         if cmd == "gh" then
--           direction = "float"
--           height    = 50
--           width     = 150
--         else
--           direction = "vertical"
--           size = 100
--         end
--
--         term_id_counter = term_id_counter + 1
--         terminals[cmd] = Terminal:new({
--           dir = vim.fn.getcwd(),
--           name = "Terminal" .. cmd,
--           direction = direction,
--           size = size,
--           count = term_id_counter,
--           float_opts = {
--             border = "curved",
--             winblend = 0,
--             height = height,
--             width = width
--           },
--           shade_terminals = false,
--           start_in_insert = true,
--         })
--       end
--
--       terminals[cmd]:toggle()
--
--       vim.defer_fn(function()
--         if terminals[cmd].direction == "vertical" then
--           vim.cmd("vertical resize " .. tostring(terminals[cmd].size))
--         end
--       end, 100)
--       vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
--         callback = function()
--           local term = terminals[cmd]
--           if term and term:is_open() and term.direction == "vertical" and term.size and cmd == "make" then
--             vim.cmd("vertical resize " .. tostring(term.size))
--           end
--         end
--       })
--     end
--
--     vim.keymap.set("n", "<leader>mtg", function()
--       toggle_custom_term("gh") -- GitHub CLI
--     end, { desc = "Toggle GitHub CLI terminal" })
--
--     vim.keymap.set("n", "<leader>mtl", function()
--       toggle_custom_term("lazygit") -- LazyGit
--     end, { desc = "Toggle LazyGit terminal" })
--
--     vim.keymap.set("n", "<leader>mtk", function()
--       toggle_custom_term("make") -- Run build
--       print("make")
--     end, { desc = "Toggle Make Build terminal" })
--   end,
-- }

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      open_mapping = [[<leader>mt]],
      float_opts = {
        border = "curved",
        winblend = 0,
        height = 75,
      },
      shade_terminals = false,
      start_in_insert = true,
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local terminals = {}
    local term_id_counter = 10

    -- 🔒 Layout lock helper
    local function preserve_terminal_layout(term)
      if not term or not term:is_open() then return end

      local bufnr = term.bufnr
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == bufnr then
          if term.direction == "vertical" then
            local width = vim.api.nvim_win_get_width(win)
            if term.size and width ~= term.size then
              vim.api.nvim_win_set_width(win, term.size)
            end
          elseif term.direction == "horizontal" then
            local height = vim.api.nvim_win_get_height(win)
            if term.size and height ~= term.size then
              vim.api.nvim_win_set_height(win, term.size)
            end
          end
        end
      end
    end

    -- 🧠 Reapply layout on any window or buffer change
    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
      callback = function()
        for _, term in pairs(terminals) do
          preserve_terminal_layout(term)
        end
      end,
    })

    -- 🎯 Main terminal toggle logic
    function _G.toggle_custom_term(cmd)
      if not terminals[cmd] then
        local direction = "horizontal"
        local height, width, size = nil, nil, nil

        if cmd == "gh" then
          direction = "float"
          height = 50
          width = 150
        else
          direction = "vertical"
          size = 100
        end

        term_id_counter = term_id_counter + 1
        terminals[cmd] = Terminal:new({
          dir = vim.fn.getcwd(),
          name = "Terminal" .. cmd,
          direction = direction,
          size = size,
          count = term_id_counter,
          float_opts = {
            border = "curved",
            winblend = 0,
            height = height,
            width = width,
          },
          shade_terminals = false,
          start_in_insert = true,
        })
      end

      terminals[cmd]:toggle()

      -- Ensure layout is restored even if terminal already exists
      vim.defer_fn(function()
        preserve_terminal_layout(terminals[cmd])
      end, 100)
    end

    -- 🔑 Keymaps
    vim.keymap.set("n", "<leader>mtg", function()
      toggle_custom_term("gh")
    end, { desc = "Toggle GitHub CLI terminal" })

    vim.keymap.set("n", "<leader>mtl", function()
      toggle_custom_term("lazygit")
    end, { desc = "Toggle LazyGit terminal" })

    vim.keymap.set("n", "<leader>mtk", function()
      toggle_custom_term("make")
      print("make")
    end, { desc = "Toggle Make Build terminal" })
  end,
}
