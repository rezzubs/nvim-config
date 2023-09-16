local servers = {
    "rust_analyzer",
    "lua_ls",
    "hls",
}

return {
    "neovim/nvim-lspconfig",

    dependencies = {
        { "folke/neodev.nvim",                   config = true },
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "j-hui/fidget.nvim",                   tag = "legacy", config = true },
    },

    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lspconfig = require "lspconfig"

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local on_attach = function(_, bufnr)
            local nmap = function(left, right, desc)
                local opts = { buffer = bufnr, noremap = true, silent = true }

                if desc then
                    opts.desc = desc
                end

                vim.keymap.set("n", left, right, opts)
            end

            nmap("gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration")
            nmap("gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
            nmap("gt", vim.lsp.buf.type_definition, "[g]o to [t]ype definition")
            nmap("gr", ":Telescope lsp_references<CR>", "[g]o to [r]eference")
            nmap("K", vim.lsp.buf.hover, "help (hover info)")
            nmap("gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")
            nmap("<C-k>", vim.lsp.buf.signature_help, "signature help")
            nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
            nmap("<leader>d", vim.diagnostic.open_float, "float [d]iagnostic")
            nmap("[d", vim.diagnostic.goto_prev, "previous [d]iagnostic")
            nmap("]d", vim.diagnostic.goto_next, "next [d]iagnostic")
            nmap("<leader>rs", ":LspRestart<CR>", "restart LSP")
            nmap("<leader>fm", function()
                vim.lsp.buf.format { async = true }
            end, "[f]or[m]at")
        end

        local signs = { Error = "", Warn = "", Info = "", Hint = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        for _, server in ipairs(servers) do
            lspconfig[server].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end
    end
}
