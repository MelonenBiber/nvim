-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Partial copy from ':h mason-lspconfig-automatic-server-setup'
-- Should auto configure all language server installed by mason if I understand correctly
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
    vim.keymap.set("n", "K",                function() vim.lsp.buf.hover()                 end, opts)
    vim.keymap.set("n", "<leader>s",        function() vim.lsp.buf.workspace_symbol()      end, opts)
    vim.keymap.set("n", "<leader>gr",       function() vim.lsp.buf.references()            end, opts)
    vim.keymap.set("n", "<Leader>a",        function() vim.lsp.buf.code_action()           end, opts)
    vim.keymap.set("n", "<leader>r",        function() vim.lsp.buf.rename()                end, opts)
    vim.keymap.set('n', '<F2>',             function() vim.lsp.buf.rename()                end, opts)
    vim.keymap.set("i", "<C-h>",            function() vim.lsp.buf.signature_help()        end, opts)
    vim.keymap.set('n', 'gd',               function() vim.lsp.buf.definition()            end, opts)
    vim.keymap.set('n', 'go',               function() vim.lsp.buf.type_definition()       end, opts)
    vim.keymap.set({'n', 'x'}, '<F3>',      function() vim.lsp.buf.format({async = true})  end, opts)
    vim.keymap.set({'n', 'x'}, '<leader>f', function() vim.lsp.buf.format({async = true})  end, opts)

    vim.keymap.set("n", "<leader>d",        function() vim.diagnostic.open_float()         end, opts)
    vim.keymap.set("n", "[d",               function() vim.diagnostic.goto_next()          end, opts)
    vim.keymap.set("n", "]d",               function() vim.diagnostic.goto_prev()          end, opts)

--  v-- Example reference
--  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- TODO: Remove at some point: Workaround for some annoying rust-analyzer bug where it interrupts typing with an error message
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

require('lspconfig')['clangd'].setup {
    cmd = {
        'clangd',
        '--header-insertion=never'
    },
}


	
  -- require('lspconfig')['rust_analyzer'].setup {
  --   capabilities = capabilities
  -- }

-- TODO
-- local lspconfig = require'lspconfig'
-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             imports = {
--                 granularity = {
--                     group = "module",
--                 },
--                 prefix = "self",
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })
--

-- local lspconfig = require('lspconfig')
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--   require'lspconfig'.rust_analyzer.setup{
--     capabilities = lsp_capabilities,
--     settings = {
--       ['rust-analyzer'] = {
--         diagnostics = {
--           enable = false;
--         }
--       }
--     }
--   }

-- lspconfig.rust_analyzer.setup({
--   capabilities = lsp_capabilities,
-- })
-- require('lspconfig').rust_analyzer.setup({})
