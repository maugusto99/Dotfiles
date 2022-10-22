-- Shorten function name
local keymap = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys normal mode
keymap("n","<up>","<nop>",opts)
keymap("n","<left>","<nop>",opts)
keymap("n","<down>","<nop>",opts)
keymap("n","<right>","<nop>",opts)

-- Disable arrow keys insert mode
keymap("i","<up>","<nop>",opts)
keymap("i","<left>","<nop>",opts)
keymap("i","<down>","<nop>",opts)
keymap("i","<right>","<nop>",opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- open netrw (Vim FileManager)
keymap("n", "<leader>oe", ':Explore<cr>', opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew <cr>", opts)
keymap("n", "<m-q>", ":tabclose<cr>", opts)

-- Delete buffer
keymap("n", "<leader>bk", ":bdelete<cr>", opts)
keymap("n", "<leader>bK", ":%bdelete<cr>", opts)

-- Buffer movement
keymap("n", "<leader>bn", ":bnext<cr>", opts)
keymap("n", "<leader>bp", ":bprevious<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fF", ":Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>bb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)
