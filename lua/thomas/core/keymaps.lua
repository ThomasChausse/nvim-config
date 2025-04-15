vim.g.mapleader = " "

local keymap = vim.keymap

-- Move selected lines down
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "sloce current split" })

keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- Normal mode: Move the current line up or down
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })

keymap.set("v", "<leader>k", "<cmd>silent! m '<-2<CR>gv=gv", { desc = "Move Lines Up" }) -- Move selected lines up
keymap.set("n", "<A-j>", "<cmd>silent! m .+1<CR>==", { desc = "Move Line Down" })        -- Move the current line down ]]
keymap.set("n", "<A-k>", "<cmd>silent! m .-2<CR>==", { desc = "Move Line Up" })          -- Move the current line upJK
keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move Lines Down" })           -- Move selected lines down

keymap.set("n", "<A-S-j>", "yyP | :m .+1<CR>", { desc = "Duplicate and Move Line Down", silent = true })
keymap.set("v", "<A-S-j>", "Vyy`>p>", { desc = "Duplicate and Move Line Down", silent = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  command = "if mode() == 'n' | set nohlsearch | endif",
})
-- Normal mode: Duplicate the current line and move it down using Alt+Shift+Down

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Indent the selected block of text in Visual Mode
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true }) -- Indent selected lines

-- Un-indent the selected block of text in Visual Mode
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true }) -- Un-indent selected lines

-- Dismiss Noice Messages
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dimiss Noice Message" })

keymap.set("v", "<C-W-j>", "<  ", { desc = "Duplicate and Move Line Down", silent = true })
keymap.set("v", "<C-W-k>", "  ", { desc = "Duplicate and Move Line Down", silent = true })


vim.keymap.set("n", "<leader>mmc", function()
  require("telescope.builtin").man_pages({
    sections = { "2", "3" }
  })
end, { desc = "C/System Man Pages" })

vim.keymap.set("n", "<leader>mmu", function()
  require("telescope.builtin").man_pages({
    sections = { "1", "8" }
  })
end, { desc = "Fuzzy-find man pages" })
