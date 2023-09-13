local servers = {
    rust_analyzer = {},
    hls = {},
    lua_ls = {},
}
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        --- Uncomment these if you want to manage LSP servers from neovim
        -- {'williamboman/mason.nvim'},
        -- {'williamboman/mason-lspconfig.nvim'},
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
            },
        },
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
        },
        {
            "folke/neodev.nvim",
            config = true,

        }
    },
    config = function()
        local lsp_zero = require "lsp-zero"

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        lsp_zero.setup_servers(vim.tbl_keys(servers))
    end
}
