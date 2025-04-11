return {
  "neomake/neomake",
  config = function()
    -- Optionally, configure neomake if necessary
    vim.g.neomake_cpp_enabled_makers = { "make" }
    vim.g.neomake_cpp_gcc_maker = {
      exe = 'make',
      args = {},
      errorformat = '%f:%l:%c: %m',
    }

    -- Optionally, bind a key to trigger neomake
    -- vim.api.nvim_set_keymap('n', '<leader>m', ':Ne,make<CR>', { noremap = true, silent = true })
  end,
}
