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

require("lazy").setup({ { import = "thomas.plugins" }, { import = "thomas.plugins.lsp" } }, {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cheker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
