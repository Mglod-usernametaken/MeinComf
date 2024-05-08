local config = function()
    local lspconfig = require("lspconfig")
    local on_attach = require("util.lsp").on_attach

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    --lua
    lspconfig.lua_ls.setup({
        --capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                --make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })
    -- Python
    lspconfig.pyright.setup({
        --capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },
    })
    -- Bash
    lspconfig.bashls.setup({
        --capabilities = capabilities,
        on_attlch = on_attach,
        filetypes = { "sh", "aliasrc" },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local flake8 = require("efmls-configs.linters.flake8")
    local black = require("efmls-configs.formatters.black")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local shfmt = require("efmls-configs.formatters.shfmt")

    --configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
            "python",
            "sh",
            --"yaml",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                python = { flake8, black },
                sh = { shellcheck, shfmt },
            },
        },
    })

    local lsp_fmt_group = vim.api.nvim_create_augroup("LspFromattingGroup", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = lsp_fmt_group,
        callback = function()
            local efm = vim.lsp.get_active_clients({ "efm" })

            if vim.tbl_isempty(efm) then
                return
            end

            vim.lsp.buf.format({ "efm" })
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
    },
}
