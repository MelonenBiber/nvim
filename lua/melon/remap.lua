vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Not really used currently, but annoys me sometimes so deactivated
    -- Move selected lines up / down + autoindent
    -- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    -- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
    
    -- Don't move cursor when appending lines with "J"
    --vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Makes selecting files through harpoon lag for some reason ????
--vim.keymap.set("n", "<CR>]", "")

--vim.keymap.set("n", "<leader>def", "z")
