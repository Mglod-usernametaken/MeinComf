local config = function()
    local lspconfig = require("lspconfig")

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
    end

    --lua
    lspconfig.lua_ls.setup({
        --capabilities = capabilities,
        --on_attach = on_attach,
        settings = {
            Lua = {
                --make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand ("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")

    --configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
        },
        init_options = {
            documetFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
            },
        },
    })
