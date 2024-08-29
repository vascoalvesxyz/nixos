vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- non dizzy movements
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- "tabbing" buffers
    vim.keymap.set("n", "<S-tab>", ":bd<CR>")
vim.keymap.set("n", "<Tab>", ":bn<CR>")

-- pasting bar over foo without losing bar
vim.keymap.set("x", "<leader>p", "\"_dP")

-- no n00b controlz
vim.keymap.set("n",  "<Up>", "<Nop>")
vim.keymap.set("n",  "<Down>", "<Nop>")
vim.keymap.set("n",  "<Left>", "<Nop>")
vim.keymap.set("n",  "<Right>", "<Nop>")

vim.keymap.set("i",  "<Up>", "<Nop>")
vim.keymap.set("i",  "<Down>", "<Nop>")
vim.keymap.set("i",  "<Left>", "<Nop>")
vim.keymap.set("i",  "<Right>", "<Nop>")

vim.keymap.set("n",  "Q", "<Nop>")

-- for compiling and previewing
vim.keymap.set("", "<leader>c", ":w! | !compiler '<c-r>%'<CR>")
vim.keymap.set("", "<leader>p", ":!opout <c-r>%<CR><CR>")
vim.keymap.set("n", "<leader>f", ":Goyo<CR>")

-- for file wide sed replacement
vim.keymap.set("n",  "S", ":%s//g<Left><Left>")

-- write with sudo
vim.keymap.set("c",  "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- use ctrl+l in insert mode to auto correct to first option
vim.keymap.set("i",  "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
