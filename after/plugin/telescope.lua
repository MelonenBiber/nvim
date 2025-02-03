--local telescope = require('telescope')

-- Enable searching for dotfiles / dotfolders
--telescope.setup {
--    defaults = {
--        hidden        = true,
--        layout_config = {
--            preview_cutoff = 1,
--            --vertical = { width = 0.1 }
--        },
--    },
--    pickers = {
--        find_files = {
--            hidden = true,
--        }
--    }
--}

local telescope = require('telescope')

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.95,
        height = 0.95,
        preview_width = 0.6,
      },
    },
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Fuzzy file search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})       -- Git search
vim.keymap.set('n', '<leader>ps', function()              -- Grep search
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pl', function()              -- Grep search
    builtin.live_grep({ });
end)
