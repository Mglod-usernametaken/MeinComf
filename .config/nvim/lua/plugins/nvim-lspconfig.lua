local config = function()
	local lspconfig = require("lspconfig")
	local on_attach = require("util.lsp").on_attach

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- vim.diagnostic.config({
	--     virtual_text = {
	--         prefix = '󰔰 ',
	--         spacing = 2,
	--     },
	--     signs = true,
	--     underline = true,
	--     update_in_insert = false,
	-- })

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
			python = {
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})
	-- Terraform
	lspconfig.terraformls.setup({
		--capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			terraform = {
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
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})
	-- Yaml
	lspconfig.yamlls.setup({
		--capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "yaml", "yml", "Dockerfile" },
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local prettier = require("efmls-configs.formatters.prettier")
	local actionlint = require("efmls-configs.linters.actionlint")
	local markdownlint = require("efmls-configs.linters.markdownlint")
	local terraform_fmt = require("efmls-configs.formatters.terraform_fmt")

	--configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"sh",
			"yaml",
			"yml",
			"md",
			"tf",
			"terraform",
			"hcl",
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
				yaml = { prettier, actionlint },
				markdown = { prettier, markdownlint },
				hcl = { terraform_fmt },
				tf = { terraform_fmt },
				terraform = { terraform_fmt },
			},
		},
	})

	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFromattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })

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
