local lazypath = vim.fn.stdpath("data") .. "/laze/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  { { import = "thomas.plugins" }, { import = "thomas.plugins.lsp" }, { import = "thomas.plugins.compile" } }, {
    dependencies = { "nvim-lua/plenary.nvim" },
    "nvim-telescope/telescope.nvim",
    cheker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  })
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    vim.defer_fn(function()
      require("thomas.themes").apply(args.match)
    end, 100)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.defer_fn(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")
          require("thomas.themes").apply(ft)
        end
      end
    end, 100)
  end,
})
