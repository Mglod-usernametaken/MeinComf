local opt = vim.opt

-- Tab / indentations
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.showmatch = true

-- Appearance
opt.relativenumber = true
opt.number = true
opt.termguicolors = true
opt.colorcolumn = '100'
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 7
opt.completeopt = "menuone,noinsert,noselect"


-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = true
opt.backup = false
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
--opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.encoding = "UTF-8"
