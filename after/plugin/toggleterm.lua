require('toggleterm').setup({
    insert_mappings = false,
    vim.keymap.set('t', '<esc>',     function() vim.cmd(':ToggleTerm') end),
    vim.keymap.set('n', '<leader>t', function() vim.cmd(':ToggleTerm') end),

    direction = 'float',
    persist_size = false,
    persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered
    hide_numbers = true, -- hide the number column in toggleterm buffers

    float_opts = {
        border = 'none',
        width = function() return vim.o.columns end,
        height = function() return vim.o.lines - 1 end, -- -1 because of the vim command line taking up space
        winblend = 0,
        title_pos = 'center',
    },

})

