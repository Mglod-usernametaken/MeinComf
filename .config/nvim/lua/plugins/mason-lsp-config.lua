local opts = {
    ensure_installed = {
        "bashls",
        "efm",
        "lua_ls",
        "pyright",
        "yamlls",
    },
    automatic_installation = true,
}

return{
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
