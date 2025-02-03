require("melon")

-- Download lazy.nvim package manager if not available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load custom nvim config file for easy vim configs
local config_path = vim.fn.stdpath("config")
vim.cmd("source " .. config_path .. "/.nvimrc")

-- Lazy.nvim wants us to define the leader before loading plugins
vim.g.mapleader = " "

-- Packages
require("lazy").setup({
  -- Fuzzy finder
    { 
        'nvim-telescope/telescope.nvim',
        commit = 'a0bbec21143c7bc5f8bb02e0005fa0b982edc026', -- PIN (tag v0.1.8)
        dependencies = { 
            {
                'nvim-lua/plenary.nvim',
                commit = '2d9b06177a975543726ce5c73fca176cedbffe9d', -- PIN (master)
            }
        },
    },

  -- Syntax tree generation
    { 
       'nvim-treesitter/nvim-treesitter',
       commit = 'cfc6f2c117aaaa82f19bcce44deec2c194d900ab', -- PIN (tag v0.9.3)
       build = ':TSUpdate',
    },

  -- Show function definition if scrolled too far
    { 
        'nvim-treesitter/nvim-treesitter-context',
        commit = '2bcf700b59bc92850ca83a1c02e86ba832e0fae0', -- PIN (master)
    },

  -- Bookmark files
    { 
        'theprimeagen/harpoon',
        commit = '1bc17e3e42ea3c46b33c0bbad6a880792692a1b3', -- PIN (master)
    },

-- < LSP stuff > --
  -- >nvim-lspconfig is a "data only" repo, providing basic, default Nvim LSP client configurations for various LSP servers.
    {
        'neovim/nvim-lspconfig',
        commit = '124be12d782d656b3c75b513a44d9e4728406078', -- PIN (tag v1.1.0)
    },
  -- >nvim-cmp source for neovim's built-in language server client.
    {
        'hrsh7th/cmp-nvim-lsp',
        commit = '99290b3ec1322070bcfb9e846450a46f6efa50f0', -- PIN (main)
    },
  -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        commit = 'b555203ce4bd7ff6192e759af3362f9d217e8c89', -- PIN (main)
        config = function() require("cmp").setup() end,
    },
  -- Easily download language servers
    {
        'williamboman/mason.nvim',
        commit = 'c43eeb5614a09dc17c03a7fb49de2e05de203924', -- PIN (v1.10.0)
        build = function() pcall(vim.cmd, 'MasonUpdate') end,
        config = function() require("mason").setup() end,
    },
  -- Auto register mason plugins 
    {
        'williamboman/mason-lspconfig.nvim',
        commit = '25c11854aa25558ee6c03432edfa0df0217324be', -- PIN (v1.31.0)
        config = function() require("mason-lspconfig").setup() end,
    },
-- < LSP stuff > --

  -- Colorscheme
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
            vim.cmd("colorscheme monokai-pro")
        end,
        commit = 'cb351c21a46e12df53e0650a5a1ee1b9d27b9a98', -- PIN (master)
    },

  -- Terminal window inside nvim
    { 
        'akinsho/toggleterm.nvim',
        commit = '87b2d6a3cab8e2bd9a0255427074285f0365398d', -- PIN (main)
        config = true,
        config = function() require("toggleterm").setup() end,
    },

  -- Automatically insert closing bracket
    {
        'windwp/nvim-autopairs',
        commit = 'b464658e9b880f463b9f7e6ccddd93fb0013f559', -- PIN (master)
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

  -- Comment out lines way easier
    {
        'numToStr/Comment.nvim',
        commit = 'e51f2b142d88bb666dcaa77d93a07f4b419aca70', -- PIN (tag v0.8.0)
        config = function() require('Comment').setup() end,
    },
})
