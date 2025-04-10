return {
  "neomake/neomake",
  config = function()
    -- Optionally, configure neomake if necessary
    vim.g.neomake_cpp_enabled_makers = { 'gcc', 'clang' }
    vim.g.neomake_cpp_gcc_maker = {
      exe = 'gcc',
      args = { '-o', '%:r', '%' },
      errorformat = '%f:%l:%c: %m',
    }

    -- Optionally, bind a key to trigger neomake
    vim.api.nvim_set_keymap('n', '<leader>m', ':Neomake<CR>', { noremap = true, silent = true })
  end,
}
